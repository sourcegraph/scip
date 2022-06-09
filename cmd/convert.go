package main

import (
	"io"
	"os"
	"strings"

	"github.com/urfave/cli/v2"

	"github.com/sourcegraph/sourcegraph/lib/codeintel/lsif/protocol/reader"
	"github.com/sourcegraph/sourcegraph/lib/errors"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

type convertFlags struct {
	from string
	to   string
}

func convertCommand() cli.Command {
	var convertFlags convertFlags
	convert := cli.Command{
		Name:  "convert",
		Usage: "Convert a SCIP index to an LSIF index",
		Flags: []cli.Flag{
			fromFlag(&convertFlags.from),
			&cli.StringFlag{
				Name:        "to",
				Usage:       "Output path for LSIF index",
				Destination: &convertFlags.to,
				DefaultText: "dump.lsif",
			},
		},
		Action: func(c *cli.Context) error {
			return convertMain(convertFlags)
		},
	}
	return convert
}

func convertMain(flags convertFlags) error {
	scipIndex, err := readFromOption(flags.from)
	if err != nil {
		return err
	}

	var lsifWriter io.Writer
	toPath := flags.to
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
