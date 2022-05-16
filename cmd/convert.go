package main

import (
	"io"
	"os"
	"strings"

	"github.com/sourcegraph/sourcegraph/lib/codeintel/lsif/protocol/reader"
	"github.com/sourcegraph/sourcegraph/lib/errors"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

func convertMain(parsedArgs map[string]interface{}) error {
	fromPath := parsedArgs["from"].(string)
	scipReader, err := makeSCIPReader(fromPath)
	if err != nil {
		return err
	}
	defer scipReader.Close()

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

	scipIndex, err := readAndParseSCIP(scipReader, fromPath)
	if err != nil {
		return err
	}

	lsifIndex, err := scip.ConvertSCIPToLSIF(scipIndex)
	if err != nil {
		return errors.Wrap(err, "failed to convert SCIP index to LSIF index")
	}

	err = reader.WriteNDJSON(reader.ElementsToJsonElements(lsifIndex), lsifWriter)
	if err != nil {
		return errors.Wrapf(err, "failed to write LSIF index to path %s", toPath)
	}

	return nil
}
