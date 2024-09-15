package scip

import (
	"testing"

	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/require"
	"golang.org/x/exp/slices"
	"pgregory.net/rapid"
)

func TestFindOccurrences(t *testing.T) {
	occurrences := []*Occurrence{
		{Range: []int32{0, 3, 4, 5}},
		{Range: []int32{1, 3, 3, 5}},
		{Range: []int32{2, 3, 5}},
		{Range: []int32{5, 3, 5}},
		{Range: []int32{6, 3, 5}},
	}

	var matchingRanges [][]int32
	for _, occurrence := range FindOccurrences(occurrences, 2, 4) {
		matchingRanges = append(matchingRanges, occurrence.Range)
	}

	expected := [][]int32{
		occurrences[2].Range,
		occurrences[1].Range,
		occurrences[0].Range,
	}
	if diff := cmp.Diff(expected, matchingRanges); diff != "" {
		t.Errorf("unexpected FindOccurrences result (-want +got):\n%s", diff)
	}
}

func TestSortOccurrences(t *testing.T) {
	occurrences := []*Occurrence{
		{Range: []int32{2, 3, 5}},       // rank 2
		{Range: []int32{11, 10, 12}},    // rank 10
		{Range: []int32{6, 3, 5}},       // rank 4
		{Range: []int32{10, 4, 8}},      // rank 6
		{Range: []int32{10, 10, 12}},    // rank 7
		{Range: []int32{0, 3, 4, 5}},    // rank 0
		{Range: []int32{12, 1, 13, 12}}, // rank 11
		{Range: []int32{11, 1, 3}},      // rank 8
		{Range: []int32{5, 3, 5}},       // rank 3
		{Range: []int32{10, 1, 3}},      // rank 5
		{Range: []int32{12, 10, 13, 3}}, // rank 13
		{Range: []int32{11, 4, 8}},      // rank 9
		{Range: []int32{12, 4, 13, 8}},  // rank 12
		{Range: []int32{1, 3, 3, 5}},    // rank 1
	}
	unsorted := make([]*Occurrence, len(occurrences))
	copy(unsorted, occurrences)

	ranges := [][]int32{}
	for _, r := range SortOccurrences(unsorted) {
		ranges = append(ranges, r.Range)
	}

	expected := [][]int32{
		occurrences[5].Range,
		occurrences[13].Range,
		occurrences[0].Range,
		occurrences[8].Range,
		occurrences[2].Range,
		occurrences[9].Range,
		occurrences[3].Range,
		occurrences[4].Range,
		occurrences[7].Range,
		occurrences[11].Range,
		occurrences[1].Range,
		occurrences[6].Range,
		occurrences[12].Range,
		occurrences[10].Range,
	}
	if diff := cmp.Diff(expected, ranges); diff != "" {
		t.Errorf("unexpected occurrence order (-want +got):\n%s", diff)
	}
}

func TestSortRanges(t *testing.T) {
	occurrences := []Range{
		NewRangeUnchecked([]int32{2, 3, 5}),       // rank 2
		NewRangeUnchecked([]int32{11, 10, 12}),    // rank 10
		NewRangeUnchecked([]int32{6, 3, 5}),       // rank 4
		NewRangeUnchecked([]int32{10, 4, 8}),      // rank 6
		NewRangeUnchecked([]int32{10, 10, 12}),    // rank 7
		NewRangeUnchecked([]int32{0, 3, 4, 5}),    // rank 0
		NewRangeUnchecked([]int32{12, 1, 13, 12}), // rank 11
		NewRangeUnchecked([]int32{11, 1, 3}),      // rank 8
		NewRangeUnchecked([]int32{5, 3, 5}),       // rank 3
		NewRangeUnchecked([]int32{10, 1, 3}),      // rank 5
		NewRangeUnchecked([]int32{12, 10, 13, 3}), // rank 13
		NewRangeUnchecked([]int32{11, 4, 8}),      // rank 9
		NewRangeUnchecked([]int32{12, 4, 13, 8}),  // rank 12
		NewRangeUnchecked([]int32{1, 3, 3, 5}),    // rank 1
	}
	unsorted := make([]Range, len(occurrences))
	copy(unsorted, occurrences)

	ranges := [][]int32{}
	for _, r := range SortRanges(unsorted) {
		ranges = append(ranges, r.SCIPRange())
	}

	// TODO - better data
	expected := [][]int32{
		occurrences[5].SCIPRange(),
		occurrences[13].SCIPRange(),
		occurrences[0].SCIPRange(),
		occurrences[8].SCIPRange(),
		occurrences[2].SCIPRange(),
		occurrences[9].SCIPRange(),
		occurrences[3].SCIPRange(),
		occurrences[4].SCIPRange(),
		occurrences[7].SCIPRange(),
		occurrences[11].SCIPRange(),
		occurrences[1].SCIPRange(),
		occurrences[6].SCIPRange(),
		occurrences[12].SCIPRange(),
		occurrences[10].SCIPRange(),
	}
	if diff := cmp.Diff(expected, ranges); diff != "" {
		t.Errorf("unexpected occurrence order (-want +got):\n%s", diff)
	}
}

func genSymbolInfo() *rapid.Generator[*SymbolInformation] {
	return rapid.Custom(func(t *rapid.T) *SymbolInformation {
		return &SymbolInformation{Symbol: rapid.String().Draw(t, "symbol")}
	})
}

func TestFindSymbolBinarySearch(t *testing.T) {
	rapid.Check(t, func(t *rapid.T) {
		symbolInfoGen := genSymbolInfo()
		symbolInfos := rapid.SliceOfN(symbolInfoGen, 0, 10).Draw(t, "symbolInfos")
		doc := &Document{Symbols: symbolInfos}
		canonicalDoc := CanonicalizeDocument(doc)
		for _, symbolInfo := range symbolInfos {
			got := FindSymbolBinarySearch(canonicalDoc, symbolInfo.Symbol)
			require.NotNil(t, got)
			require.Equal(t, symbolInfo.Symbol, got.Symbol)
		}
		other := rapid.String().Draw(t, "otherSymbol")
		isInOriginalSlice := slices.ContainsFunc(symbolInfos, func(info *SymbolInformation) bool {
			return info.Symbol == other
		})
		got := FindSymbolBinarySearch(canonicalDoc, other)
		if isInOriginalSlice {
			require.NotNil(t, got)
			require.Equal(t, other, got.Symbol)
		} else {
			require.Nil(t, got)
		}
	})
}
