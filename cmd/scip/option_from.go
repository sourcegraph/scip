package main

import (
	"io"
	"os"
	"strings"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/sourcegraph/lib/errors"
	"google.golang.org/protobuf/proto"
)

// readFromOptions reads the fromPath parameter into a SCIP Index message.
// If fromPath has the value "-" then the SCIP Index is read from os.Stdin.
// Otherwise, fromPath is interpreted as a file path and the bytes are read from disk.
func readFromOption(fromPath string) (*scip.Index, error) {
	var scipReader io.Reader
	if fromPath == "-" {
		scipReader = os.Stdin
	} else if !strings.HasSuffix(fromPath, ".scip") && !strings.HasSuffix(fromPath, ".lsif-typed") {
		return nil, errors.Newf("expected file with .scip extension but found %s", fromPath)
	} else {
		scipFile, err := os.Open(fromPath)
		defer scipFile.Close()
		if err != nil {
			return nil, err
		}
		scipReader = scipFile
	}

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
