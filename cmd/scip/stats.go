package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math"
	"net/url"
	"os"
	"path/filepath"

	"github.com/cockroachdb/errors"
	"github.com/hhatto/gocloc"
	"github.com/montanaflynn/stats"
	conciter "github.com/sourcegraph/conc/iter"
	"github.com/sourcegraph/conc/pool"
	"github.com/urfave/cli/v2"
	"golang.org/x/exp/slices"
	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

type statsFlags struct {
	from              string
	customProjectRoot string
}

func statsCommand() cli.Command {
	var statsFlags statsFlags
	stats := cli.Command{
		Name:  "stats",
		Usage: "Output useful statistics about a SCIP index",
		Flags: []cli.Flag{
			fromFlag(&statsFlags.from),
			projectRootFlag(&statsFlags.customProjectRoot),
		},
		Action: func(c *cli.Context) error {
			return statsMain(statsFlags)
		},
	}
	return stats
}

func statsMain(flags statsFlags) error {
	from := flags.from
	index, err := readFromOption(from)
	if err != nil {
		return errors.Wrap(err, "error reading SCIP file")
	}
	if index.Metadata == nil {
		return errors.Errorf("Index.Metadata is nil (--from=%s)", from)
	}
	output := map[string]interface{}{}
	indexStats, err := countStatistics(index, flags.customProjectRoot)
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
	Sum         N               `json:"sum"`
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
	Documents                   int32        `json:"totalDocuments"`
	DocumentSizes               Stats[int32] `json:"documentSizes"`
	LinesOfCode                 int32        `json:"totalLinesOfCode"`
	Occurrences                 int32        `json:"totalOccurrences"`
	OccurrenceCounts            Stats[int32] `json:"occurrenceCountsPerDocument"`
	SymbolInfos                 int32        `json:"totalSymbolInfos"`
	SymbolInfoCounts            Stats[int32] `json:"symbolInfoCountsPerDocument"`
	Definitions                 int32        `json:"totalDefinitions"`
	DefinitionCounts            Stats[int32] `json:"definitionCountsPerDocument"`
	OccurrenceCountsPerLine     BinnedStats  `json:"occurrenceCountsPerLine"`
	Relationships               int32        `json:"totalRelationships"`
	RelationshipCounts          Stats[int32] `json:"relationshipCountsPerDocument"`
	RelationshipCountsPerSymbol BinnedStats  `json:"relationshipCountsPerSymbol"`
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
}

func newPerDocRawStats(d *scip.Document) perDocRawStats {
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
	for _, occ := range d.Occurrences {
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
	*d = scip.Document{}
	return perDocRawStats{
		serializedSizeBytes: int32(serializedSizeBytes),
		definitionCount:     int32(definitionCount),
		symbolInfoCounts:    int32(symbolInfoCounts),
		relationshipCount:   relsPerSymbol,
		occurrencesPerLine:  occsPerLine,
	}
}

func mergeAllStats(rs []perDocRawStats) indexStatistics {
	cpuPool := pool.New()
	var out indexStatistics
	docSizes := make([]float64, 0, len(rs))
	defCounts := make([]float64, 0, len(rs))
	symbolInfoCounts := make([]float64, 0, len(rs))
	relationshipCountBins := make([]Bins, 0, len(rs))
	occurrencesPerLineBins := make([]Bins, 0, len(rs))
	for _, rs := range rs {
		docSizes = append(docSizes, float64(rs.serializedSizeBytes))
		defCounts = append(defCounts, float64(rs.definitionCount))
		symbolInfoCounts = append(symbolInfoCounts, float64(rs.symbolInfoCounts))
		relationshipCountBins = append(relationshipCountBins, rs.relationshipCount)
		occurrencesPerLineBins = append(occurrencesPerLineBins, rs.occurrencesPerLine)
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
	squaredDiffs := make([]float64, 0, len(agg))
	for _, bin := range agg2 {
		diff := float64(bin.Value) - mean
		squaredDiffs = append(squaredDiffs, diff*diff*float64(bin.Count)/float64(totalValues))
	}
	squaredDiffsSum, _ := stats.Sum(squaredDiffs)
	stddev := roundToSigfigs(math.Sqrt(squaredDiffsSum/(float64(len(agg2))-1.0)), 3)
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

func countStatistics(index *scip.Index, customProjectRoot string) (*indexStatistics, error) {
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
		return newPerDocRawStats(*d)
	})
	stats := mergeAllStats(allStats)
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
	if num < 0 {
		sign = -1
		num = -num
	}

	exponent := math.Floor(math.Log10(num))
	factor := math.Pow(10, exponent-float64(numSigfigs-1))

	num = sign * math.Round(num/factor) * factor

	return num
}
