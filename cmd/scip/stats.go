package main

import (
	"encoding/binary"
	"encoding/json"
	"fmt"
	"log"
	"math"
	"math/rand/v2"
	"net/url"
	"os"
	"path/filepath"

	"github.com/cockroachdb/errors"
	"github.com/hhatto/gocloc"
	"github.com/montanaflynn/stats"
	"github.com/pierrec/lz4/v4"
	conciter "github.com/sourcegraph/conc/iter"
	"github.com/sourcegraph/conc/pool"
	"github.com/urfave/cli/v2"

	"golang.org/x/exp/slices"
	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

type statsFlags struct {
	from              string
	includeStats      cli.StringSlice
	customProjectRoot string
}

func extraStatsFlag(storage *cli.StringSlice) *cli.StringSliceFlag {
	return &cli.StringSliceFlag{
		Name:        "extra-stats",
		Usage:       "Comma separated values of extra statistics to gather. Allowed values: [compression-ratios].",
		Destination: storage,
	}
}

func statsCommand() cli.Command {
	var statsFlags statsFlags
	stats := cli.Command{
		Name:  "stats",
		Usage: "Output useful statistics about a SCIP index",
		Flags: []cli.Flag{
			fromFlag(&statsFlags.from),
			projectRootFlag(&statsFlags.customProjectRoot),
			extraStatsFlag(&statsFlags.includeStats),
		},
		Action: func(c *cli.Context) error {
			return statsMain(statsFlags)
		},
	}
	return stats
}

func statsMain(flags statsFlags) error {
	from := flags.from
	includeCompression := slices.Contains(flags.includeStats.Value(), "compression-ratios")
	index, err := readFromOption(from)
	if err != nil {
		return errors.Wrap(err, "error reading SCIP file")
	}
	if index.Metadata == nil {
		return errors.Errorf("Index.Metadata is nil (--from=%s)", from)
	}
	output := map[string]interface{}{}
	indexStats, err := countStatistics(index, statsOptions{includeCompression}, flags.customProjectRoot)
	if err != nil {
		return errors.Wrap(err, "error counting stats")
	}
	jsonBytes, err := json.MarshalIndent(indexStats, "", "  ")
	if err != nil {
		return errors.Wrapf(err, "failed to marshall into JSON %s", output)
	}
	fmt.Println(string(jsonBytes))
	return nil
}

type Percentiles[N any] struct {
	Fifty               N `json:"50"`
	Ninety              N `json:"90"`
	NinetyFive          N `json:"95"`
	NinetyNine          N `json:"99"`
	NinetyNinePointNine N `json:"99.9"`
}

type GenericStats[N any, NP any] struct {
	Percentiles Percentiles[NP] `json:"percentiles"`
	Mean        N               `json:"mean"`
	Stddev      N               `json:"stddev"`
	Max         N               `json:"max"`
	Sum         N               `json:"-"`
	Comment     string          `json:"comment,omitempty"`
}

type Stats[N any] GenericStats[N, N]

func MapPercentiles[A any, B any](s Percentiles[A], f func(A) B) Percentiles[B] {
	return Percentiles[B]{
		Fifty:               f(s.Fifty),
		Ninety:              f(s.Ninety),
		NinetyFive:          f(s.NinetyFive),
		NinetyNine:          f(s.NinetyNine),
		NinetyNinePointNine: f(s.NinetyNinePointNine),
	}
}

func MapStats[A any, B any](s Stats[A], f func(A) B) Stats[B] {
	out := Stats[B]{
		Percentiles: MapPercentiles(s.Percentiles, f),
		Mean:        f(s.Mean),
		Stddev:      f(s.Stddev),
		Max:         f(s.Max),
		Sum:         f(s.Sum),
		Comment:     s.Comment,
	}
	return out
}

type BinnedStats struct {
	Bins     []BinData                    `json:"bins"`
	BinCount int32                        `json:"binCount"`
	Stats    GenericStats[float64, int32] `json:"stats"`
}

type BinData struct {
	Value      int32     `json:"value"`
	Count      int32     `json:"count"`
	Percentage float64   `json:"percentage"`
	Examples   []example `json:"examples,omitempty"`
}

func PercentilesFromBinData(bins []BinData) Percentiles[int32] {
	percentile50Set := false
	percentile90Set := false
	percentile95Set := false
	percentile99Set := false
	percentile99_9Set := false
	cumulativePercentage := 0.0
	out := Percentiles[int32]{}
	for _, binData := range bins {
		cumulativePercentage += binData.Percentage
		if !percentile50Set && cumulativePercentage >= 50.0 {
			out.Fifty = binData.Value
			percentile50Set = true
		}
		if !percentile90Set && cumulativePercentage >= 90.0 {
			out.Ninety = binData.Value
			percentile90Set = true
		}
		if !percentile95Set && cumulativePercentage >= 95.0 {
			out.NinetyFive = binData.Value
			percentile95Set = true
		}
		if !percentile99Set && cumulativePercentage >= 99.0 {
			out.NinetyNine = binData.Value
			percentile99Set = true
		}
		if !percentile99_9Set && cumulativePercentage >= 99.9 {
			out.NinetyNinePointNine = binData.Value
			percentile99_9Set = true
		}
	}
	return out
}

func NewStatsFloat64(values []float64) Stats[float64] {
	s := Stats[float64]{}
	s.Percentiles.Fifty = percentileFloat(values, 50)
	s.Percentiles.Ninety = percentileFloat(values, 90)
	s.Percentiles.NinetyFive = percentileFloat(values, 95)
	s.Percentiles.NinetyNine = percentileFloat(values, 99)
	s.Percentiles.NinetyNinePointNine = percentileFloat(values, 99.9)
	mean, _ := stats.Mean(values)
	s.Mean = mean
	stddev, _ := stats.StandardDeviation(values)
	s.Stddev = stddev
	max, _ := stats.Max(values)
	s.Max = max
	sum, _ := stats.Sum(values)
	s.Sum = sum
	return s
}

func NewStatsInt32(values []float64) Stats[int32] {
	return MapStats(NewStatsFloat64(values), func(x float64) int32 {
		return int32(x)
	})
}

type indexStatistics struct {
	Documents                   int32             `json:"totalDocuments"`
	DocumentSizes               Stats[int32]      `json:"documentSizes"`
	LinesOfCode                 int32             `json:"totalLinesOfCode"`
	Occurrences                 int32             `json:"totalOccurrences"`
	OccurrenceCounts            Stats[int32]      `json:"occurrenceCountsPerDocument"`
	SymbolInfos                 int32             `json:"totalSymbolInfos"`
	SymbolInfoCounts            Stats[int32]      `json:"symbolInfoCountsPerDocument"`
	Definitions                 int32             `json:"totalDefinitions"`
	DefinitionCounts            Stats[int32]      `json:"definitionCountsPerDocument"`
	OccurrenceCountsPerLine     BinnedStats       `json:"occurrenceCountsPerLine"`
	CompressionRatios           CompressionRatios `json:"compressionRatios,omitempty"`
	Relationships               int32             `json:"totalRelationships"`
	RelationshipCounts          Stats[int32]      `json:"relationshipCountsPerDocument"`
	RelationshipCountsPerSymbol BinnedStats       `json:"relationshipCountsPerSymbol"`
}

type CompressionRatios struct {
	LineStarts Stats[float64] `json:"lineStarts"`
	LineDeltas Stats[float64] `json:"lineDeltas"`
	CharStarts Stats[float64] `json:"charStarts"`
	CharDeltas Stats[float64] `json:"charDeltas"`
	SuffixIDs  Stats[float64] `json:"suffixIDs"`
	Roles      Stats[float64] `json:"roles"`
	Comment    string         `json:"comment"`
}

type compressionStats struct {
	compressedSize   int32
	uncompressedSize int32
}

// The slices may be empty if the document has fewer
// than CHUNK_SIZE occurrences.
type perDocCompressionStats struct {
	LineStarts []compressionStats
	LineDeltas []compressionStats
	CharStarts []compressionStats
	CharDeltas []compressionStats
	SuffixIDs  []compressionStats
	Roles      []compressionStats
}

func calculateCompressionRatios(cs []compressionStats) []float64 {
	out := make([]float64, 0, len(cs))
	for _, c := range cs {
		if c.uncompressedSize == 0 {
			panic("uncompressedSize == 0")
		}
		out = append(out, float64(c.compressedSize)/float64(c.uncompressedSize))
	}
	return out
}

type example struct {
	DocPath string  `json:"relative_path"`
	Symbol  *string `json:"symbol,omitempty"`
	Line    *int32  `json:"line,omitempty"`
}

type binData struct {
	count    int32
	examples []example
}

type Bins map[int32]binData

type perDocRawStats struct {
	serializedSizeBytes int32
	definitionCount     int32
	symbolInfoCounts    int32
	relationshipCount   Bins
	occurrencesPerLine  Bins
	compressionStats    perDocCompressionStats
}

type fakeSuffixIDMaker struct {
	cache map[string]int32
	next  int32
	rng   *rand.Rand
}

func newFakeSuffixIDMaker() *fakeSuffixIDMaker {
	return &fakeSuffixIDMaker{
		cache: make(map[string]int32),
		next:  1000000,
		rng:   rand.New(rand.NewPCG(0, 0)),
	}
}

func (f *fakeSuffixIDMaker) makeSuffixID(s string) int32 {
	if id, ok := f.cache[s]; ok {
		return id
	}
	id := f.next
	f.next += 1 + int32(f.rng.ExpFloat64())
	f.cache[s] = id
	return id
}

const CHUNK_SIZE = 200

type statsOptions struct {
	includeCompressionStats bool
}

func newPerDocRawStats(d *scip.Document, options statsOptions) perDocRawStats {
	bytes, _ := proto.Marshal(d)
	serializedSizeBytes := len(bytes)
	bytes = nil
	definitionCount := 0
	symbolInfoCounts := len(d.Symbols)
	curLine, occsInCurLine := int32(-1), int32(0)
	relsPerSymbol := Bins{}
	for _, sym := range d.Symbols {
		data := relsPerSymbol[int32(len(sym.Relationships))]
		data.count += 1
		if len(sym.Relationships) > 10 {
			data.examples = append(data.examples, example{
				DocPath: d.RelativePath,
				Symbol:  &sym.Symbol,
				Line:    nil,
			})
		}
		relsPerSymbol[int32(len(sym.Relationships))] = data
	}
	occsPerLine := Bins{}
	suffixIDMaker := newFakeSuffixIDMaker()
	int32ArrayLen := 0
	if options.includeCompressionStats {
		int32ArrayLen = len(d.Occurrences)
	}
	lineStarts := make([]int32, 0, int32ArrayLen)
	lineDeltas := make([]int32, 0, int32ArrayLen)
	charStarts := make([]int32, 0, int32ArrayLen)
	charDeltas := make([]int32, 0, int32ArrayLen)
	suffixIDs := make([]int32, 0, int32ArrayLen)
	roles := make([]int32, 0, int32ArrayLen)
	slices.SortFunc(d.Occurrences, func(a, b *scip.Occurrence) bool {
		return scip.NewRangeUnchecked(a.Range).Less(scip.NewRangeUnchecked(b.Range))
	})
	for _, occ := range d.Occurrences {
		r := scip.NewRangeUnchecked(occ.Range)
		if options.includeCompressionStats {
			lineStarts = append(lineStarts, r.Start.Line)
			lineDeltas = append(lineDeltas, r.End.Line-r.Start.Line)
			charStarts = append(charStarts, r.Start.Character)
			charDeltas = append(charDeltas, r.End.Character-r.Start.Character)
			suffixIDs = append(suffixIDs, suffixIDMaker.makeSuffixID(occ.Symbol))
			roles = append(roles, occ.SymbolRoles)
		}
		if scip.SymbolRole_Definition.Matches(occ) {
			definitionCount += 1
		}
		if occ.Range[0] == curLine {
			occsInCurLine += 1
			continue
		}
		prevLine := curLine
		curLine = occ.Range[0]
		if prevLine != -1 {
			if occsInCurLine == 0 {
				panic("Invariant violation: expected occsInCurLine > 0")
			}
			data := occsPerLine[occsInCurLine]
			data.count += 1
			if occsInCurLine > 100 {
				data.examples = append(data.examples, example{
					DocPath: d.RelativePath,
					Symbol:  nil,
					Line:    &prevLine,
				})
			}
			occsPerLine[occsInCurLine] = data
		}
		occsInCurLine = 1
	}
	compressionRatios := perDocCompressionStats{}
	if options.includeCompressionStats {
		compressor := newCompressor()
		for i := 0; i+CHUNK_SIZE <= len(d.Occurrences); i += CHUNK_SIZE {
			compressionRatios.LineStarts = append(compressionRatios.LineStarts, compressor.encodeCompressAndGetStats(lineStarts[i:i+CHUNK_SIZE]))
			compressionRatios.LineDeltas = append(compressionRatios.LineDeltas, compressor.encodeCompressAndGetStats(lineDeltas[i:i+CHUNK_SIZE]))
			compressionRatios.CharStarts = append(compressionRatios.CharStarts, compressor.encodeCompressAndGetStats(charStarts[i:i+CHUNK_SIZE]))
			compressionRatios.CharDeltas = append(compressionRatios.CharDeltas, compressor.encodeCompressAndGetStats(charDeltas[i:i+CHUNK_SIZE]))
			compressionRatios.SuffixIDs = append(compressionRatios.SuffixIDs, compressor.encodeCompressAndGetStats(suffixIDs[i:i+CHUNK_SIZE]))
			compressionRatios.Roles = append(compressionRatios.Roles, compressor.encodeCompressAndGetStats(roles[i:i+CHUNK_SIZE]))
		}
	}

	*d = scip.Document{}
	return perDocRawStats{
		serializedSizeBytes: int32(serializedSizeBytes),
		definitionCount:     int32(definitionCount),
		symbolInfoCounts:    int32(symbolInfoCounts),
		relationshipCount:   relsPerSymbol,
		occurrencesPerLine:  occsPerLine,
		compressionStats:    compressionRatios,
	}
}

type compressor struct {
	sizeHint             int
	scratchInputBuf      []byte
	scratchCompressedBuf []byte
	compressor           lz4.Compressor
}

func newCompressor() *compressor {
	return &compressor{
		// This is zero-initialized since binary.Encode will overwrite values.
		scratchInputBuf:      make([]byte, CHUNK_SIZE*4),
		scratchCompressedBuf: make([]byte, CHUNK_SIZE*4),
		compressor:           lz4.Compressor{},
	}
}

func (c *compressor) encodeCompressAndGetStats(values []int32) compressionStats {
	n, err := binary.Encode(c.scratchInputBuf, binary.LittleEndian, values)
	if err != nil {
		panic(fmt.Sprintf("binary encoding failed: %v", err.Error()))
	}
	if n != CHUNK_SIZE*4 {
		panic(fmt.Sprintf("Encoded size: %v, expected %v", n, CHUNK_SIZE*4))
	}
	compressedSize, err := c.compressor.CompressBlock(c.scratchInputBuf[:n], c.scratchCompressedBuf)
	if err != nil {
		panic(fmt.Sprintf("compressor encoding failed: %v", err.Error()))
	}
	return compressionStats{compressedSize: int32(compressedSize), uncompressedSize: int32(n)}
}

func mergeAllStats(rs []perDocRawStats, options statsOptions) indexStatistics {
	cpuPool := pool.New()
	var out indexStatistics
	docSizes := make([]float64, 0, len(rs))
	defCounts := make([]float64, 0, len(rs))
	symbolInfoCounts := make([]float64, 0, len(rs))
	relationshipCountBins := make([]Bins, 0, len(rs))
	occurrencesPerLineBins := make([]Bins, 0, len(rs))
	combinedCompressionStats := perDocCompressionStats{}
	for _, ds := range rs {
		docSizes = append(docSizes, float64(ds.serializedSizeBytes))
		defCounts = append(defCounts, float64(ds.definitionCount))
		symbolInfoCounts = append(symbolInfoCounts, float64(ds.symbolInfoCounts))
		relationshipCountBins = append(relationshipCountBins, ds.relationshipCount)
		occurrencesPerLineBins = append(occurrencesPerLineBins, ds.occurrencesPerLine)
		if options.includeCompressionStats {
			combinedCompressionStats.LineStarts = append(combinedCompressionStats.LineStarts, ds.compressionStats.LineStarts...)
			combinedCompressionStats.LineDeltas = append(combinedCompressionStats.LineDeltas, ds.compressionStats.LineDeltas...)
			combinedCompressionStats.CharStarts = append(combinedCompressionStats.CharStarts, ds.compressionStats.CharStarts...)
			combinedCompressionStats.CharDeltas = append(combinedCompressionStats.CharDeltas, ds.compressionStats.CharDeltas...)
			combinedCompressionStats.SuffixIDs = append(combinedCompressionStats.SuffixIDs, ds.compressionStats.SuffixIDs...)
			combinedCompressionStats.Roles = append(combinedCompressionStats.Roles, ds.compressionStats.Roles...)
		}
	}
	cpuPool.Go(func() {
		out.DocumentSizes = NewStatsInt32(docSizes)
	})
	cpuPool.Go(func() {
		out.OccurrenceCounts, out.OccurrenceCountsPerLine = NewBinnedStats(occurrencesPerLineBins)
		out.Occurrences = out.OccurrenceCounts.Sum
	})
	cpuPool.Go(func() {
		out.DefinitionCounts = NewStatsInt32(defCounts)
		out.Definitions = out.DefinitionCounts.Sum
	})
	cpuPool.Go(func() {
		out.SymbolInfoCounts = NewStatsInt32(symbolInfoCounts)
		out.SymbolInfos = out.SymbolInfoCounts.Sum
	})
	cpuPool.Go(func() {
		out.RelationshipCounts, out.RelationshipCountsPerSymbol = NewBinnedStats(relationshipCountBins)
		out.Relationships = out.RelationshipCounts.Sum
	})
	if options.includeCompressionStats {
		cpuPool.Go(func() {
			crs := &out.CompressionRatios
			comb := combinedCompressionStats
			crs.LineStarts = NewStatsFloat64(calculateCompressionRatios(comb.LineStarts))
			crs.LineDeltas = NewStatsFloat64(calculateCompressionRatios(comb.LineDeltas))
			crs.CharStarts = NewStatsFloat64(calculateCompressionRatios(comb.CharStarts))
			crs.CharDeltas = NewStatsFloat64(calculateCompressionRatios(comb.CharDeltas))
			crs.SuffixIDs = NewStatsFloat64(calculateCompressionRatios(comb.SuffixIDs))
			crs.Roles = NewStatsFloat64(calculateCompressionRatios(comb.Roles))
			crs.Comment = fmt.Sprintf("Calculated using fixed size chunks of %d int32s (lz4)", CHUNK_SIZE)
		})
	}
	cpuPool.Wait()
	return out
}

func NewBinnedStats(bins []Bins) (Stats[int32], BinnedStats) {
	agg := map[int32]binData{}
	perDocTotals := make([]float64, 0, len(bins))
	for _, bin := range bins {
		perDocTotals = append(perDocTotals, 0)
		for binKey, binVal := range bin {
			data := agg[binKey]
			data.count += binVal.count
			data.examples = append(data.examples, binVal.examples...)
			agg[binKey] = data
			perDocTotals[len(perDocTotals)-1] += float64(binVal.count)
		}
	}
	perDocStats := NewStatsInt32(perDocTotals)
	totalValues := perDocStats.Sum

	agg2 := []BinData{}
	weighted := make([]float64, 0, len(agg))
	for binValue, binData := range agg {
		agg2 = append(agg2, BinData{
			Value:      binValue,
			Count:      binData.count,
			Percentage: float64(binData.count) / float64(totalValues) * 100,
			Examples:   binData.examples,
		})
		if totalValues == 0.0 {
			panic("totalValues == 0.0")
		}
		weighted = append(weighted, float64(binValue)*float64(binData.count)/float64(totalValues))
	}
	slices.SortFunc(agg2, func(a, b BinData) bool {
		return a.Value < b.Value
	})
	percentiles := PercentilesFromBinData(agg2)
	for i := range agg2 {
		agg2[i].Percentage = roundToSigfigs(agg2[i].Percentage, 3)
	}
	mean, _ := stats.Sum(weighted)
	weighted = nil
	stddev := 0.0
	if len(agg2) != 1 {
		// See https://en.wikipedia.org/wiki/Weighted_arithmetic_mean#Frequency_weights
		squaredDiffs := make([]float64, 0, len(agg2))
		for _, bin := range agg2 {
			diff := float64(bin.Value) - mean
			squaredDiffs = append(squaredDiffs, diff*diff*float64(bin.Count))
		}
		squaredDiffsSum, _ := stats.Sum(squaredDiffs)
		stddev = roundToSigfigs(math.Sqrt(squaredDiffsSum/(float64(totalValues)-1.0)), 3)
	}
	mean = roundToSigfigs(mean, 3)

	agg = nil

	binStats := BinnedStats{
		Bins:     agg2,
		BinCount: int32(len(agg2)),
		Stats: GenericStats[float64, int32]{
			Percentiles: percentiles,
			Mean:        mean,
			Stddev:      stddev,
			Max:         float64(agg2[len(agg2)-1].Value),
			Sum:         float64(totalValues),
		},
	}
	return perDocStats, binStats
}

func countStatistics(index *scip.Index, options statsOptions, customProjectRoot string) (*indexStatistics, error) {
	loc, err := countLinesOfCode(index, customProjectRoot)
	var linesOfCode int32
	if err != nil {
		// Keep this a non-fatal error so that we can measure other index stats
		// even if the project is not cloned locally (e.g. if it's a huge
		// project like Chromium or the Linux kernel).
		log.Printf("Couldn't count lines of code: %s", err)
	} else {
		linesOfCode = loc.Total.Code
	}
	totalDocumentsCount := int32(len(index.Documents))
	allStats := conciter.Map(index.Documents, func(d **scip.Document) perDocRawStats {
		return newPerDocRawStats(*d, options)
	})
	stats := mergeAllStats(allStats, options)
	stats.LinesOfCode = linesOfCode
	stats.Documents = totalDocumentsCount
	stats.DocumentSizes.Comment = "sizes are in bytes"
	stats.DefinitionCounts.Comment = "counted using occurrences"
	return &stats, nil
}

func percentileFloat(buf []float64, percent float64) float64 {
	res, _ := stats.Percentile(buf, percent)
	return res
}

func countLinesOfCode(index *scip.Index, customProjectRoot string) (*gocloc.Result, error) {
	var localSource string
	root, err := url.Parse(index.Metadata.ProjectRoot)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to parse Index.Metadata.ProjectRoot as a URI %s", index.Metadata.ProjectRoot)
	}
	if customProjectRoot != "" {
		localSource = customProjectRoot
	} else {
		_, err := os.Stat(root.Path)
		if errors.Is(err, os.ErrNotExist) {
			cwd, _ := os.Getwd()
			log.Printf("Project root [%s] doesn't exist, using current working directory [%s] instead. "+
				"To override this behaviour, specify --project-root=<folder> option", root.Path, cwd)
			localSource = cwd
		} else if err != nil {
			return nil, errors.Wrapf(err, "stat path: %q", root.Path)
		}
		localSource = root.Path
	}

	stat, err := os.Stat(localSource)
	if err != nil {
		return nil, errors.Wrapf(err, "stat path: %q", localSource)
	}
	if !stat.IsDir() {
		return nil, errors.Errorf("Project root [%s] is not a directory", localSource)
	}
	processor := gocloc.NewProcessor(gocloc.NewDefinedLanguages(), gocloc.NewClocOptions())
	var paths []string
	for _, document := range index.Documents {
		paths = append(paths, filepath.Join(localSource, document.RelativePath))
	}
	return processor.Analyze(paths)
}

func roundToSigfigs(num float64, numSigfigs int) float64 {
	sign := 1.0
	if num == 0.0 { // TODO: Is this correct for values close to zero?
		return 0.0
	}
	if num < 0 {
		sign = -1
		num = -num
	}

	exponent := math.Floor(math.Log10(num))
	factor := math.Pow(10, exponent-float64(numSigfigs-1))

	num = sign * math.Round(num/factor) * factor

	return num
}
