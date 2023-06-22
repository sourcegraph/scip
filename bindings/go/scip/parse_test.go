package scip

import (
	"bytes"
	"compress/gzip"
	"os"
	"regexp"
	"testing"

	"github.com/google/go-cmp/cmp"
	"github.com/google/gofuzz"
	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/encoding/protojson"
	"google.golang.org/protobuf/proto"
)

func TestFuzz(t *testing.T) {
	pat := regexp.MustCompile("^(state|sizeCache|unknownFields|SignatureDocumentation)$")
	f := fuzz.New().NumElements(0, 2).SkipFieldsWithPattern(pat)
	for i := 0; i < 100; i++ {
		index := Index{}
		f.Fuzz(&index)

		indexBytes, err := proto.Marshal(&index)
		require.NoError(t, err)
		bytesReader := bytes.NewReader(indexBytes)
		parsedIndex := Index{}

		indexVisitor := IndexVisitor{func(metadata *Metadata) {
			parsedIndex.Metadata = metadata
		}, func(document *Document) {
			parsedIndex.Documents = append(parsedIndex.Documents, document)
		}, func(extSym *SymbolInformation) {
			parsedIndex.ExternalSymbols = append(parsedIndex.ExternalSymbols, extSym)
		}}

		if err := indexVisitor.ParseStreaming(bytesReader); err != nil {
			t.Fatalf("failed to parse index: %s\ngot error: %v",
				protojson.MarshalOptions{Multiline: true}.Format(&index), err)
		}

		if !proto.Equal(&index, &parsedIndex) {
			want := protojson.MarshalOptions{Multiline: true}.Format(&index)
			got := protojson.MarshalOptions{Multiline: true}.Format(&parsedIndex)
			diff := cmp.Diff(want, got)
			require.NotEqual(t, diff, "")
			t.Fatalf("index (-want, +got): %s", diff)
		}
	}
}

func TestLargeDocuments(t *testing.T) {
	// Copied from the Sourcegraph monorepo, which triggered a bug
	// where Reader.read() didn't actually fill a buffer completely,
	// due to the presence of large documents.
	gzipped, err := os.Open("./testdata/index1.scip.gz")
	if err != nil {
		t.Fatalf("unexpected error reading test file: %s", err)
	}
	reader, err := gzip.NewReader(gzipped)
	if err != nil {
		t.Fatalf("unexpected error unzipping test file: %s", err)
	}

	parsedIndex := Index{}

	indexVisitor := IndexVisitor{func(metadata *Metadata) {
		parsedIndex.Metadata = metadata
	}, func(document *Document) {
		parsedIndex.Documents = append(parsedIndex.Documents, document)
	}, func(extSym *SymbolInformation) {
		parsedIndex.ExternalSymbols = append(parsedIndex.ExternalSymbols, extSym)
	}}

	if err := indexVisitor.ParseStreaming(reader); err != nil {
		t.Fatalf("got error parsing index %v", err)
	}
}
