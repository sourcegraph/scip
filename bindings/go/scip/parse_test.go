package scip

import (
	"bytes"
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

		processIndex := IndexVisitor{func(metadata *Metadata) {
			parsedIndex.Metadata = metadata
		}, func(document *Document) {
			parsedIndex.Documents = append(parsedIndex.Documents, document)
		}, func(extSym *SymbolInformation) {
			parsedIndex.ExternalSymbols = append(parsedIndex.ExternalSymbols, extSym)
		}}

		if err := ParseStreaming(bytesReader, processIndex); err != nil {
			t.Fatalf("failed to parse index: %s\ngot error: %v",
				protojson.MarshalOptions{Multiline: true}.Format(&index),
				err)
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
