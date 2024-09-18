package scip

import (
	"fmt"
	"io"
	"os"
	"strings"
	"testing"
	"time"
	"unicode/utf8"

	simdutf8 "github.com/bytedance/sonic/utf8"
	"github.com/google/go-cmp/cmp"
	"github.com/sourcegraph/beaut"
	"github.com/sourcegraph/beaut/lib/knownwf"
	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/proto"
)

func TestParseSymbol(t *testing.T) {
	type test struct {
		Symbol   string
		Expected *Symbol
	}
	tests := []test{
		{Symbol: "local a", Expected: newLocalSymbol("a")},
		{Symbol: "a b c d method().", Expected: &Symbol{
			Scheme: "a",
			Package: &Package{
				Manager: "b",
				Name:    "c",
				Version: "d",
			},
			Descriptors: []*Descriptor{{Name: "method", Suffix: Descriptor_Method}},
		}},
		// Backtick-escaped descriptor
		{Symbol: "a b c d `e f`.", Expected: &Symbol{
			Scheme: "a",
			Package: &Package{
				Manager: "b",
				Name:    "c",
				Version: "d",
			},
			Descriptors: []*Descriptor{{Name: "e f", Suffix: Descriptor_Term}},
		}},
		// Space-escaped package name
		{Symbol: "a b  c d e f.", Expected: &Symbol{
			Scheme: "a",
			Package: &Package{
				Manager: "b c",
				Name:    "d",
				Version: "e",
			},
			Descriptors: []*Descriptor{{Name: "f", Suffix: Descriptor_Term}},
		}},
		{
			Symbol: "lsif-java maven package 1.0.0 java/io/File#Entry.method(+1).(param)[TypeParam]",
			Expected: &Symbol{
				Scheme:  "lsif-java",
				Package: &Package{Manager: "maven", Name: "package", Version: "1.0.0"},
				Descriptors: []*Descriptor{
					{Name: "java", Suffix: Descriptor_Namespace},
					{Name: "io", Suffix: Descriptor_Namespace},
					{Name: "File", Suffix: Descriptor_Type},
					{Name: "Entry", Suffix: Descriptor_Term},
					{Name: "method", Disambiguator: "+1", Suffix: Descriptor_Method},
					{Name: "param", Suffix: Descriptor_Parameter},
					{Name: "TypeParam", Suffix: Descriptor_TypeParameter},
				},
			},
		},
		{
			Symbol: "rust-analyzer cargo std 1.0.0 macros/println!",
			Expected: &Symbol{
				Scheme:  "rust-analyzer",
				Package: &Package{Manager: "cargo", Name: "std", Version: "1.0.0"},
				Descriptors: []*Descriptor{
					{Name: "macros", Suffix: Descriptor_Namespace},
					{Name: "println", Suffix: Descriptor_Macro},
				},
			},
		},
	}
	for _, test := range tests {
		t.Run(test.Symbol, func(t *testing.T) {
			obtained, err := ParseSymbol(test.Symbol)
			require.Nil(t, err)
			if diff := cmp.Diff(obtained.String(), test.Expected.String()); diff != "" {
				t.Fatalf("unexpected response (-want +got):\n%s", diff)
			}
		})
	}
}

func TestParseSymbolError(t *testing.T) {
	for _, symbolName := range []string{
		"",
		"lsif-java maven package 1.0.0",
		"lsif-java maven package 1.0.0 java/io/File#Entry.trailingstring",
		"lsif-java maven package 1.0.0 java/io/File#Entry.unrecognizedSuffix@",
		"lsif-java maven package 1.0.0 java/io/File#Entry.nonSimpλeIdentifier.",
		"local 🧠",
		"local ",
		"local &&&",
	} {

		if _, err := ParseSymbol(symbolName); err == nil {
			t.Fatalf("expected error from parsing %q", symbolName)
		}
	}
}

func testBenchmarkAllocs(t *testing.T, f func(b *testing.B), threshold int64) {
	res := testing.Benchmark(f)
	allocs := res.AllocsPerOp()
	if allocs > threshold {
		t.Fatalf("Expected AllocsPerOp <= %d, got %d", threshold, allocs)
	}
}

type simpleBenchmark struct {
	N    int
	MaxN int
}

type benchmarkResult struct {
	benchmarkName string
	timings       []timing
}

func (r *benchmarkResult) String() string {
	var sb strings.Builder
	sb.WriteString(fmt.Sprintf("Benchmark %s:\n", r.benchmarkName))
	for _, timing := range r.timings {
		sb.WriteString(fmt.Sprintf("\t%d: %s\n", timing.N, timing.totalTime))
	}
	return sb.String()
}

type timing struct {
	N         int
	totalTime time.Duration
}

func (b *simpleBenchmark) run(name string, f func(*simpleBenchmark)) benchmarkResult {
	var timings []timing
	for n := 1000; n <= b.MaxN; n = n * 10 {
		b.N = n
		start := time.Now()
		f(b)
		delta := time.Now().Sub(start)
		timings = append(timings, struct {
			N         int
			totalTime time.Duration
		}{N: n, totalTime: delta})
	}
	return benchmarkResult{name, timings}
}

func TestUtf8Validation(t *testing.T) {
	path := "/Users/varun/Code/play/indexes/llvm/3.scip"
	scipReader, err := os.Open(path)
	require.Nil(t, err)
	scipBytes, err := io.ReadAll(scipReader)
	require.Nil(t, err)
	scipIndex := Index{}
	require.NoError(t, proto.Unmarshal(scipBytes, &scipIndex))
	allOccurrences := []*Occurrence{}
	for _, document := range scipIndex.Documents {
		allOccurrences = append(allOccurrences, document.Occurrences...)
	}
	parseBenchmark := func(b *simpleBenchmark) {
		for i := 0; i < b.N; i++ {
			occ := allOccurrences[i]
			_, _ = ParseSymbol(occ.Symbol)
		}
	}
	parseV2Benchmark := func(b *simpleBenchmark) {
		var sym Symbol
		for i := 0; i < b.N; i++ {
			occ := allOccurrences[i]
			_ = parsePartialSymbolV2(occ.Symbol, true, &sym)
		}
	}
	stdUtf8ValidationOnly := func(b *simpleBenchmark) {
		for i := 0; i < b.N; i++ {
			occ := allOccurrences[i]
			utf8.ValidString(occ.Symbol)
		}
	}
	simdUtf8ValidationOnly := func(b *simpleBenchmark) {
		for i := 0; i < b.N; i++ {
			occ := allOccurrences[i]
			simdutf8.ValidateString(occ.Symbol)
		}
	}
	sb := simpleBenchmark{MaxN: len(allOccurrences)}
	res1 := sb.run("parse", parseBenchmark)
	res1_2 := sb.run("parseV2", parseV2Benchmark)
	res2 := sb.run("stdUtf8ValidationOnly", stdUtf8ValidationOnly)
	_ = simdUtf8ValidationOnly
	//res3 := sb.run("simdUtf8ValidationOnly", simdUtf8ValidationOnly)
	t.Fatalf("Benchmark results:\n%s\n%s\n%s\n", res1.String(), res1_2.String(), res2.String())
	//t.Fatalf("Benchmark results:\n%s\n%s\n%s\n", res1.String(), res2.String(), res3.String())
}

func TestBasic(t *testing.T) {
	utf8str, _ := beaut.NewUTF8String("cxx . . $ g(91b051fbe1b42daf).")
	_, err := ParseSymbolUTF8(utf8str)
	require.NoError(t, err)
}
func TestEquivalent(t *testing.T) {
	path := "/Users/varun/Code/play/indexes/llvm/3.scip"
	scipReader, err := os.Open(path)
	require.Nil(t, err)
	scipBytes, err := io.ReadAll(scipReader)
	require.Nil(t, err)
	scipIndex := Index{}
	require.NoError(t, proto.Unmarshal(scipBytes, &scipIndex))
	for _, document := range scipIndex.Documents {
		for _, occ := range document.Occurrences {
			sym1, err := ParseSymbol(occ.Symbol)
			require.NoError(t, err)
			sym2, err := ParseSymbolUTF8(beaut.NewUTF8StringUnchecked(occ.Symbol, knownwf.UTF8DeserializedFromProtobufString))
			require.NoError(t, err)
			require.Equal(t, sym1.Scheme, sym2.Scheme)
			require.Equal(t, sym1.Package, sym2.Package)
			require.Equal(t, len(sym1.Descriptors), len(sym2.Descriptors))
			for i := range sym1.Descriptors {
				d1 := sym1.Descriptors[i]
				d2 := sym2.Descriptors[i]
				require.Equal(t, d1.Name, d2.Name)
				require.Equal(t, d1.Suffix, d2.Suffix)
				require.Equal(t, d1.Disambiguator, d2.Disambiguator)
			}
		}
	}
}
