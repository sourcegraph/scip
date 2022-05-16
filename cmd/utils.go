package main

import (
	"io"
	"os"
	"strings"

	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/sourcegraph/lib/errors"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

func makeSCIPReader(pathOrStdin string) (io.ReadCloser, error) {
	if pathOrStdin == "-" {
		return io.NopCloser(os.Stdin), nil
	}
	if !strings.HasSuffix(pathOrStdin, ".scip") && !strings.HasSuffix(pathOrStdin, ".lsif-typed") {
		return nil, errors.Newf("expected file with .scip extension but found %s", pathOrStdin)
	}
	scipFile, err := os.Open(pathOrStdin)
	if err != nil {
		return nil, err
	}
	return scipFile, nil
}

func readAndParseSCIP(scipReader io.Reader, fromPath string) (*scip.Index, error) {
	scipBytes, err := io.ReadAll(scipReader)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to read SCIP index at path %s", fromPath)
	}

	scipIndex := scip.Index{}
	err = proto.Unmarshal(scipBytes, &scipIndex)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to parse SCIP index at path %s", fromPath)
	}

	return &scipIndex, nil
}
