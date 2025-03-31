package memtest

import (
	"context"
	"fmt"
	"io"
	"os"
	"runtime"
	"runtime/debug"
	"strings"
	"testing"

	"github.com/sourcegraph/beaut"
	"github.com/sourcegraph/beaut/lib/knownwf"
	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

// Do not add any other tests in this sub-package, so that the
// SetMemoryLimit call doesn't interfere with other running tests

func TestLowMemoryParsing(t *testing.T) {
	// NOTE: This test must not run in parallel with the other one.
	tmpFile, err := os.CreateTemp(t.TempDir(), "very-large-index.scip")
	require.NoError(t, err)
	defer os.RemoveAll(tmpFile.Name())

	// Total index size will be about (textSize + ε) * docCount ~= 128 MB
	const textSize = 128 * 1024
	const docCount = 1000
	{
		largeIndex := scip.Index{}
		for i := 0; i < docCount; i++ {
			doc := scip.Document{}
			doc.Text = strings.Repeat(fmt.Sprintf("%d", i), textSize)
			largeIndex.Documents = append(largeIndex.Documents, &doc)
		}
		indexBytes, err := proto.Marshal(&largeIndex)
		require.NoError(t, err)
		_, err = tmpFile.Write(indexBytes)
		require.NoError(t, err)

		_, err = tmpFile.Seek(0, io.SeekStart)
		require.NoError(t, err)

		runtime.GC()
	}

	require.Greater(t, docCount, 100)
	const maxDocsInMemory = docCount / 100
	debug.SetMemoryLimit(textSize * maxDocsInMemory)

	curDoc := &scip.Document{}
	indexVisitor := scip.IndexVisitor{
		VisitDocument: func(_ context.Context, d *scip.Document) error {
			curDoc = d
			return nil
		},
	}

	// No OOM
	err = indexVisitor.ParseStreaming(context.Background(), tmpFile)
	_ = curDoc
	require.NoError(t, err)
}

func TestParseSymbol_ZeroAllocationsIfMemoryAvailable(t *testing.T) {
	// This test must not run in parallel with the other one.
	str := beaut.NewUTF8StringUnchecked("cxx . mypkg v1.0.0 Foo#Bar(abcdef0123456789).", knownwf.UTF8OtherReason)
	sym := &scip.Symbol{
		Scheme:  "",
		Package: &scip.Package{},
		Descriptors: []*scip.Descriptor{
			&scip.Descriptor{},
			&scip.Descriptor{},
		},
	}
	var before, after runtime.MemStats
	runtime.GC()
	old := debug.SetGCPercent(-1)

	runtime.ReadMemStats(&before)
	parseErr := scip.ParseSymbolUTF8With(str, scip.ParseSymbolOptions{IncludeDescriptors: true, RecordOutput: sym})
	runtime.ReadMemStats(&after)

	require.NoError(t, parseErr)
	require.Equal(t, before.TotalAlloc, after.TotalAlloc, "pre-allocated symbol should not cause extra allocations")

	runtime.ReadMemStats(&before)
	validateErr := scip.ValidateSymbolUTF8(str)
	runtime.ReadMemStats(&after)

	require.NoError(t, validateErr)
	require.Equal(t, before.TotalAlloc, after.TotalAlloc, "pre-allocated symbol should not cause extra allocations")

	debug.SetGCPercent(old)
}

// Do not add any other tests in this sub-package, so that the
// SetMemoryLimit call doesn't interfere with other running tests
