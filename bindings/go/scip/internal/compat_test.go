package internal

import (
	"io"
	"os"
	"path/filepath"
	"sync/atomic"
	"testing"

	"github.com/sourcegraph/beaut"
	"github.com/sourcegraph/beaut/lib/knownwf"
	conciter "github.com/sourcegraph/conc/iter"
	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/internal/shared"
	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/proto"
)

func TestParseCompat(t *testing.T) {
	for _, path := range shared.SampleIndexes() {
		t.Run(filepath.Base(path), func(t *testing.T) {
			t.Parallel()
			scipReader, err := os.Open(path)
			require.Nil(t, err)
			scipBytes, err := io.ReadAll(scipReader)
			require.Nil(t, err)
			scipIndex := scip.Index{}
			require.NoError(t, proto.Unmarshal(scipBytes, &scipIndex))
			var total atomic.Int64
			conciter.ForEach(scipIndex.Documents, func(docPtr **scip.Document) {
				document := *docPtr
				if total.Load() > 1000*1000 {
					return
				}
				total.Add(int64(len(document.Occurrences)))
				var newSym scip.Symbol
				for i := 0; i < len(document.Occurrences); i++ {
					occ := document.Occurrences[i]
					oldSym, oldErr := ParsePartialSymbolV1ToBeDeleted(occ.Symbol, true)
					var newErr error
					require.NotPanics(t, func() {
						str := beaut.NewUTF8StringUnchecked(occ.Symbol, knownwf.UTF8DeserializedFromProtobufString)
						newErr = scip.ParseSymbolUTF8With(str, scip.ParseSymbolOptions{
							IncludeDescriptors: true,
							RecordOutput:       &newSym,
						})
					}, "panic for symbol: %q", occ.Symbol)
					if oldErr != nil {
						require.Error(t, newErr,
							"old parser gave error %v but parse was successful with new parser (symbol: %q)",
							oldErr.Error(), occ.Symbol)
						continue
					} else if newErr != nil {
						require.NoError(t, newErr,
							"new parser gave error %v but parse was successful with old parser (symbol: %q)",
							newErr.Error(), occ.Symbol)
					}
					require.Equal(t, oldSym.Scheme, newSym.Scheme)
					require.Equal(t, oldSym.Package, newSym.Package)
					require.Equalf(t, len(oldSym.Descriptors), len(newSym.Descriptors), "symbol: %v, d1: %+v, d2: %+v", occ.Symbol,
						oldSym.Descriptors, newSym.Descriptors)
					for i, d := range oldSym.Descriptors {
						dnew := newSym.Descriptors[i]
						require.Equal(t, d.Name, dnew.Name, "symbol: %v", occ.Symbol)
						require.Equal(t, d.Suffix, dnew.Suffix, "symbol: %v", occ.Symbol)
						require.Equal(t, d.Disambiguator, dnew.Disambiguator, "symbol: %v", occ.Symbol)
					}
				}
			})
		})
	}
}
