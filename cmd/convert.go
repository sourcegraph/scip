package main

import (
	"io"
	"os"
	"strings"

	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/sourcegraph/lib/codeintel/lsif/protocol/reader"
	"github.com/sourcegraph/sourcegraph/lib/errors"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

func convertMain(parsedArgs map[string]interface{}) error {
	var scipReader io.Reader
	fromPath := parsedArgs["from"].(string)
	if fromPath == "-" {
		scipReader = os.Stdin
	} else if !strings.HasSuffix(fromPath, ".scip") && !strings.HasSuffix(fromPath, ".lsif-typed") {
		return errors.Newf("expected file with .scip extension but found %s", fromPath)
	} else {
		scipFile, err := os.Open(fromPath)
		defer scipFile.Close()
		if err != nil {
			return err
		}
		scipReader = scipFile
	}

	var lsifWriter io.Writer
	toPath := parsedArgs["to"].(string)
	if toPath == "-" {
		lsifWriter = os.Stdout
	} else if !strings.HasSuffix(toPath, ".lsif") {
		return errors.Newf("expected file with .lsif extension but found %s", toPath)
	} else {
		lsifFile, err := os.OpenFile(toPath, os.O_WRONLY|os.O_CREATE, 0666)
		defer lsifFile.Close()
		if err != nil {
			return err
		}
		lsifWriter = lsifFile
	}

	scipBytes, err := io.ReadAll(scipReader)
	if err != nil {
		return errors.Wrapf(err, "failed to read SCIP index at path %s", fromPath)
	}

	scipIndex := scip.Index{}
	err = proto.Unmarshal(scipBytes, &scipIndex)
	if err != nil {
		return errors.Wrapf(err, "failed to parse SCIP index at path %s", fromPath)
	}

	lsifIndex, err := scip.ConvertSCIPToLSIF(&scipIndex)
	if err != nil {
		return errors.Wrap(err, "failed to convert SCIP index to LSIF index")
	}

	err = reader.WriteNDJSON(reader.ElementsToJsonElements(lsifIndex), lsifWriter)
	if err != nil {
		return errors.Wrapf(err, "failed to write LSIF index to path %s", toPath)
	}

	return nil
}
