package scip

import (
	"bytes"
	"compress/gzip"
	"context"
	"io"
	"os"
	"regexp"
	"testing"

	"github.com/google/go-cmp/cmp"
	"github.com/google/gofuzz"
	"github.com/stretchr/testify/require"
	"google.golang.org/protobuf/encoding/protojson"
	"google.golang.org/protobuf/proto"
)

func TestEmpty(t *testing.T) {
	index := Index{}
	checkRoundtrip(t, &index)
}

func TestFuzz(t *testing.T) {
	pat := regexp.MustCompile("^(state|sizeCache|unknownFields|SignatureDocumentation)$")
	f := fuzz.New().NumElements(0, 2).SkipFieldsWithPattern(pat)
	for i := 0; i < 100; i++ {
		index := Index{}
		f.Fuzz(&index)

		checkRoundtrip(t, &index)
	}
}

func getTestIndex(t *testing.T) *gzip.Reader {
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
	return reader
}

func TestLargeDocuments(t *testing.T) {
	reader := getTestIndex(t)
	_ = parseStreaming(t, reader)
}

func TestDocumentsOnly(t *testing.T) {
	pat := regexp.MustCompile("^(state|sizeCache|unknownFields|SignatureDocumentation)$")
	f := fuzz.New().NumElements(0, 2).SkipFieldsWithPattern(pat)
	for i := 0; i < 100; i++ {
		index := Index{}
		f.Fuzz(&index)

		parsedIndex := Index{}

		indexVisitor := IndexVisitor{
			VisitDocument: func(ctx context.Context, document *Document) error {
				parsedIndex.Documents = append(parsedIndex.Documents, document)
				return nil
			},
		}

		indexBytes, err := proto.Marshal(&index)
		require.NoError(t, err)
		bytesReader := bytes.NewReader(indexBytes)

		if err := indexVisitor.ParseStreaming(context.Background(), bytesReader); err != nil {
			t.Fatalf("got error parsing index %v", err)
		}

		onlyDocumentsIndex := Index{}
		onlyDocumentsIndex.Documents = index.Documents

		checkIndexEqual(t, &onlyDocumentsIndex, &parsedIndex)
	}
}

func checkIndexEqual(t *testing.T, expected *Index, got *Index) {
	if !proto.Equal(expected, got) {
		want := protojson.MarshalOptions{Multiline: true}.Format(expected)
		got := protojson.MarshalOptions{Multiline: true}.Format(got)
		diff := cmp.Diff(want, got)
		require.NotEqual(t, diff, "")
		t.Fatalf("index (-want, +got): %s", diff)
	}
}

func checkRoundtrip(t *testing.T, index *Index) {
	indexBytes, err := proto.Marshal(index)
	require.NoError(t, err)
	bytesReader := bytes.NewReader(indexBytes)

	parsedIndex := parseStreaming(t, bytesReader)

	checkIndexEqual(t, index, parsedIndex)
}

func parseStreaming(t *testing.T, reader io.Reader) *Index {
	parsedIndex := Index{}

	indexVisitor := IndexVisitor{
		VisitMetadata: func(_ context.Context, metadata *Metadata) error {
			parsedIndex.Metadata = metadata
			return nil
		},
		VisitDocument: func(_ context.Context, document *Document) error {
			parsedIndex.Documents = append(parsedIndex.Documents, document)
			return nil
		},
		VisitExternalSymbol: func(_ context.Context, extSym *SymbolInformation) error {
			parsedIndex.ExternalSymbols = append(parsedIndex.ExternalSymbols, extSym)
			return nil
		},
	}

	if err := indexVisitor.ParseStreaming(context.Background(), reader); err != nil {
		t.Fatalf("got error parsing index %v", err)
	}
	return &parsedIndex
}
