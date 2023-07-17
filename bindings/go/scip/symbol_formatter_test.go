package scip

import (
	"testing"

	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/require"
)

func TestSymbolFormatter(t *testing.T) {
	expected := "zeroth  escape first  escape second  escape third  escape `github.com/foo/``bar/n2/n3/n4`/T#f()."
	symbol := &Symbol{
		Scheme: "zeroth escape",
		Package: &Package{
			Manager: "first escape",
			Name:    "second escape",
			Version: "third escape",
		},
		Descriptors: []*Descriptor{
			{Name: "github.com/foo/`bar/n2/n3/n4", Suffix: Descriptor_Namespace},
			{Name: "T", Suffix: Descriptor_Type},
			{Name: "f", Suffix: Descriptor_Method},
		},
	}

	if diff := cmp.Diff(expected, VerboseSymbolFormatter.FormatSymbol(symbol)); diff != "" {
		t.Fatalf("unexpected response (-want +got):\n%s", diff)
	}
}

func TestSymbolFormatterRoundTrip(t *testing.T) {
	type test struct {
		Symbol string
	}
	tests := []test{
		{"lsif-java maven package 1.0.0 java/io/File#Entry.method(+1).(param)[TypeParam]"},
		{"rust-analyzer cargo std 1.0.0 macros/println!"},
		{"zeroth  escape first  escape second  escape third  escape `github.com/foo/``bar/n2/n3/n4`/T#f()."},
	}
	for _, test := range tests {
		t.Run(test.Symbol, func(t *testing.T) {
			formatted, err := VerboseSymbolFormatter.Format(test.Symbol)
			require.Nil(t, err)

			if diff := cmp.Diff(test.Symbol, formatted); diff != "" {
				t.Fatalf("unexpected response (-want +got):\n%s", diff)
			}
		})
	}
}
