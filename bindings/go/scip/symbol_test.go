package scip

import (
	"testing"

	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/require"
)

func TestParseSymbol(t *testing.T) {
	type test struct {
		Symbol   string
		Expected *Symbol
	}
	tests := []test{
		{Symbol: "local a", Expected: &Symbol{
			Scheme:      "local",
			Descriptors: []*Descriptor{{Name: "a", Suffix: Descriptor_Local}},
		}},
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
		{
			Symbol: "cxx . todo-pkg todo-version gfx/Rect#x(455f465bc33b4cdf).",
			Expected: &Symbol{
				Scheme:  "cxx",
				Package: &Package{Name: "todo-pkg", Version: "todo-version"},
				Descriptors: []*Descriptor{
					{Name: "gfx", Suffix: Descriptor_Namespace},
					{Name: "Rect", Suffix: Descriptor_Type},
					{Name: "x", Disambiguator: "455f465bc33b4cdf", Suffix: Descriptor_Method},
				},
			},
		},
		{
			Symbol: "cxx . . $ `<external>/4398592474888995393/assert.h:92:11`!",
			Expected: &Symbol{
				Scheme:  "cxx",
				Package: &Package{Manager: "", Name: "", Version: "$"},
				Descriptors: []*Descriptor{
					{Name: "<external>/4398592474888995393/assert.h:92:11", Suffix: Descriptor_Macro},
				},
			},
		},
		{
			Symbol: "cxx . . $ llvm/itanium_demangle/OutputBuffer#empty(50ce9a9e25b4a850).",
			Expected: &Symbol{
				Scheme:  "cxx",
				Package: &Package{Manager: "", Name: "", Version: "$"},
				Descriptors: []*Descriptor{
					{Name: "llvm", Suffix: Descriptor_Namespace},
					{Name: "itanium_demangle", Suffix: Descriptor_Namespace},
					{Name: "OutputBuffer", Suffix: Descriptor_Type},
					{Name: "empty", Disambiguator: "50ce9a9e25b4a850", Suffix: Descriptor_Method},
				},
			},
		},
		{
			Symbol: "a b c d `F⃗`.", Expected: &Symbol{
				Scheme: "a",
				Package: &Package{
					Manager: "b",
					Name:    "c",
					Version: "d",
				},
				Descriptors: []*Descriptor{{
					Name: "F⃗", Suffix: Descriptor_Term,
				}},
			},
		},
	}
	for _, test := range tests {
		t.Run(test.Symbol, func(t *testing.T) {
			obtained, err := ParseSymbol(test.Symbol)
			require.Nil(t, err)
			if diff := cmp.Diff(test.Expected.String(), obtained.String()); diff != "" {
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
		require.NotPanics(t, func() {
			if _, err := ParseSymbol(symbolName); err == nil {
				t.Fatalf("expected error from parsing %q", symbolName)
			}
		}, "panic when parsing %q", symbolName)
	}
}
