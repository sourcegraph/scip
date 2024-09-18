package main

import (
	"fmt"
	"io"
	"os"
	"runtime"
	"runtime/debug"
	"time"

	"github.com/jedib0t/go-pretty/v6/table"
	"github.com/jedib0t/go-pretty/v6/text"
	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/beaut"
	"github.com/sourcegraph/beaut/lib/knownwf"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/internal"
	"github.com/sourcegraph/scip/bindings/go/scip/internal/shared"
)

// NOTE: We don't run this benchmark using the standard
// Go benchmarking tooling because that doesn't offer
// any control over the number of iterations performed.
func main() {
	for _, path := range shared.SampleIndexes() {
		benchmark(path)
	}
}

func benchmark(path string) {
	scipReader, err := os.Open(path)
	if err != nil {
		panic(fmt.Sprintf("failed to open file %q: %v", path, err.Error()))
	}
	scipBytes, err := io.ReadAll(scipReader)
	if err != nil {
		panic(fmt.Sprintf("failed to read file %q: %v", path, err.Error()))
	}
	scipIndex := scip.Index{}
	if err := proto.Unmarshal(scipBytes, &scipIndex); err != nil {
		panic(fmt.Sprintf("failed to unmarshal index %q: %v", path, err.Error()))
	}
	allOccurrences := []*scip.Occurrence{}
	for _, document := range scipIndex.Documents {
		allOccurrences = append(allOccurrences, document.Occurrences...)
	}
	parserV1Benchmark := func(b *simpleBenchmark) {
		for i := 0; i < b.N; i++ {
			occ := allOccurrences[i]
			_, err = internal.ParsePartialSymbolV1ToBeDeleted(occ.Symbol, true)
			if err != nil {
				//panic(fmt.Sprintf("v1: index path: %v: error: %v", path, err))
			}
		}
	}
	parserV2Benchmark := func(b *simpleBenchmark) {
		for i := 0; i < b.N; i++ {
			occ := allOccurrences[i]
			str := beaut.NewUTF8StringUnchecked(occ.Symbol, knownwf.UTF8DeserializedFromProtobufString)
			sym := scip.Symbol{}
			err = scip.ParseSymbolUTF8With(str, scip.ParseSymbolOptions{IncludeDescriptors: true, RecordOutput: &sym})
			if err != nil {
				//panic(fmt.Sprintf("v2: index path: %v: error: %v", path, err))
			}
		}
	}
	parserV2ValidateBenchmark := func(b *simpleBenchmark) {
		for i := 0; i < b.N; i++ {
			occ := allOccurrences[i]
			str := beaut.NewUTF8StringUnchecked(occ.Symbol, knownwf.UTF8DeserializedFromProtobufString)
			err = scip.ValidateSymbolUTF8(str)
			if err != nil {
				//panic(fmt.Sprintf("v2: index path: %v: error: %v", path, err))
			}
		}
	}
	sb := simpleBenchmark{MaxN: 100 * 1000}
	v1Results := sb.run("Symbol parse (v1)", parserV1Benchmark)
	v2Results := sb.run("Symbol parse (v2)", parserV2Benchmark)
	v2ValidateResults := sb.run("Symbol validate (v2)", parserV2ValidateBenchmark)

	fmt.Printf("Benchmark for %q:\n%s\n", path,
		sb.tabulate(v1Results, v2Results, v2ValidateResults))
}

func (sb *simpleBenchmark) tabulate(baseline benchmarkResult, otherResults ...benchmarkResult) string {
	tw := table.NewWriter()
	headers := []any{"Benchmark / Iterations"}
	for n := 1000; n <= sb.MaxN; n = n * 10 {
		headers = append(headers, n)
		headers = append(headers, "Ratio")
	}
	tw.AppendHeader(headers)
	allResults := append([]benchmarkResult{baseline}, otherResults...)
	{
		for i, res := range allResults {
			row := []any{res.benchmarkName + " - Speed"}
			rowAlign := []table.RowConfig{{AutoMergeAlign: text.AlignRight}}
			for j, t := range res.timings {
				row = append(row, fmt.Sprintf("%v/op", t.timePerOp()))
				rowAlign = append(rowAlign, table.RowConfig{AutoMergeAlign: text.AlignRight})
				if i == 0 {
					row = append(row, "-")
					rowAlign = append(rowAlign, table.RowConfig{AutoMergeAlign: text.AlignCenter})
				} else {
					ratio := float64(t.timePerOp()) / float64(allResults[0].timings[j].timePerOp())
					row = append(row, fmt.Sprintf("%.2fx", ratio))
					rowAlign = append(rowAlign, table.RowConfig{AutoMergeAlign: text.AlignRight})
				}
			}
			tw.AppendRow(row, rowAlign...)
		}
	}
	{
		for i, res := range allResults {
			row := []any{res.benchmarkName + " - Allocs"}
			rowAlign := []table.RowConfig{{AutoMergeAlign: text.AlignRight}}
			for j, h := range res.heapAllocs {
				row = append(row, fmt.Sprintf("%dB/op", h.allocsPerOp()))
				rowAlign = append(rowAlign, table.RowConfig{AutoMergeAlign: text.AlignRight})
				if i == 0 {
					row = append(row, "-")
					rowAlign = append(rowAlign, table.RowConfig{AutoMergeAlign: text.AlignCenter})
				} else {
					ratio := float64(h.allocsPerOp()) / float64(allResults[0].heapAllocs[j].allocsPerOp())
					row = append(row, fmt.Sprintf("%.2fx", ratio))
					rowAlign = append(rowAlign, table.RowConfig{AutoMergeAlign: text.AlignRight})
				}
			}
			tw.AppendRow(row, rowAlign...)
		}
	}
	return tw.Render()
}

type simpleBenchmark struct {
	N    int
	MaxN int
}

type benchmarkResult struct {
	benchmarkName string
	timings       []timing
	heapAllocs    []allocBytes
}

type timing struct {
	N         int
	totalTime time.Duration
}

type allocBytes struct {
	N          int
	totalAlloc uint64
}

func (a allocBytes) allocsPerOp() uint64 {
	return a.totalAlloc / uint64(a.N)
}

func (t timing) timePerOp() time.Duration {
	return time.Duration(int64(t.totalTime) / int64(t.N))
}

func (b *simpleBenchmark) run(name string, f func(*simpleBenchmark)) benchmarkResult {
	var timings []timing
	for n := 1000; n <= b.MaxN; n = n * 10 {
		b.N = n
		start := time.Now()
		f(b)
		delta := time.Now().Sub(start)
		timings = append(timings, timing{N: n, totalTime: delta})
	}
	old := debug.SetGCPercent(-1)
	var allocs []allocBytes
	for n := 1000; n <= b.MaxN; n = n * 10 {
		runtime.GC()
		var before, after runtime.MemStats
		runtime.ReadMemStats(&before)
		f(b)
		runtime.ReadMemStats(&after)
		allocs = append(allocs, allocBytes{N: n, totalAlloc: after.TotalAlloc - before.TotalAlloc})
	}
	debug.SetGCPercent(old)
	return benchmarkResult{name, timings, allocs}
}
