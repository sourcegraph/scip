package memtest

import (
	"fmt"
	"io"
	"os"
	"runtime"
	"runtime/debug"
	"strings"
	"testing"

	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

// Do not add any other tests in this sub-package, so that the
// SetMemoryLimit call doesn't interfere with other running tests

func TestLowMemoryParsing(t *testing.T) {
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
	indexVisitor := scip.IndexVisitor{VisitDocument: func(d *scip.Document) {
		curDoc = d
	}}

	// No OOM
	err = indexVisitor.ParseStreaming(tmpFile)
	_ = curDoc
	require.NoError(t, err)
}

// Do not add any other tests in this sub-package, so that the
// SetMemoryLimit call doesn't interfere with other running tests
