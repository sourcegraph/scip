package scip

import (
	"testing"

	"github.com/google/go-cmp/cmp"
)

func TestCanonicalizeDocument(t *testing.T) {
	document := &Document{
		RelativePath: "foo.go",
		Symbols: []*SymbolInformation{
			{Symbol: "foo"},
			{Symbol: "bar"},
			{Symbol: "bonk"},

			// duplicates
			{Symbol: "baz", Relationships: []*Relationship{{Symbol: "bazzer", IsReference: true}}},
			{Symbol: "baz", Relationships: []*Relationship{{Symbol: "bazImpl", IsImplementation: true}}},

			// duplicates
			{Symbol: "quux", Documentation: []string{"docs1"}},
			{Symbol: "quux", Documentation: []string{"docs2"}},
		},
		Occurrences: []*Occurrence{
			// illegal range (removed)
			{Range: []int32{}, Symbol: "foo"},

			{Range: []int32{2, 1, 2, 4}, Symbol: "bar", SymbolRoles: int32(SymbolRole_Definition)},
			{Range: []int32{1, 1, 1, 4}, Symbol: "foo"},
			{Range: []int32{4, 1, 4, 4}, Symbol: "bonk"},
			{Range: []int32{6, 1, 6, 4}, Symbol: "honk"},

			// duplicates (same symbol name)
			{Range: []int32{5, 1, 5, 4}, Symbol: "quux", OverrideDocumentation: []string{"primo"}},
			{Range: []int32{5, 1, 5, 4}, Symbol: "quux", OverrideDocumentation: []string{"secondo"}},

			// duplicate (different symbol name)
			{Range: []int32{3, 1, 4, 4}, Symbol: "baz"},
			{Range: []int32{3, 1, 4, 4}, Symbol: "bazImpl"},
		},
	}
	canonicalizedDocument := CanonicalizeDocument(document)

	expectedDocument := &Document{
		RelativePath: "foo.go",
		Symbols: []*SymbolInformation{
			{Symbol: "bar"},
			{Symbol: "baz", Relationships: []*Relationship{{Symbol: "bazImpl", IsImplementation: true}, {Symbol: "bazzer", IsReference: true}}},
			{Symbol: "bonk"},
			{Symbol: "foo"},
			{Symbol: "quux", Documentation: []string{"docs1", "docs2"}},
		},
		Occurrences: []*Occurrence{
			{Range: []int32{1, 1, 4}, Symbol: "foo"},
			{Range: []int32{2, 1, 4}, Symbol: "bar", SymbolRoles: int32(SymbolRole_Definition)},
			{Range: []int32{3, 1, 4, 4}, Symbol: "baz"},
			{Range: []int32{3, 1, 4, 4}, Symbol: "bazImpl"},
			{Range: []int32{4, 1, 4}, Symbol: "bonk"},
			{Range: []int32{5, 1, 4}, Symbol: "quux", OverrideDocumentation: []string{"primo", "secondo"}},
			{Range: []int32{6, 1, 4}, Symbol: "honk"},
		},
	}
	if diff := cmp.Diff(expectedDocument, canonicalizedDocument, compareDocuments); diff != "" {
		t.Fatalf("unexpected document (-want +got):\n%s", diff)
	}
}
