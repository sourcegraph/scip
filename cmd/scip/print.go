package main

import (
	"io"
	"math"

	"github.com/k0kubun/pp/v3"
	"github.com/urfave/cli/v2"
	"google.golang.org/protobuf/encoding/protojson"

	"github.com/sourcegraph/sourcegraph/lib/errors"
)

func printCommand() cli.Command {
	var json bool
	snapshot := cli.Command{
		Name:  "print",
		Usage: "Print a SCIP index in a human-readable format for debugging",
		Description: `WARNING: The output may change over time.
Do not rely on the output of this command in scripts`,
		Flags: []cli.Flag{
			&cli.BoolFlag{
				Name:        "json",
				Usage:       "Output in JSON format",
				Destination: &json,
			},
		},
		Action: func(c *cli.Context) error {
			indexPath := c.Args().Get(0)
			if indexPath == "" {
				return errors.New("missing argument for path to SCIP index")
			}
			return printMain(indexPath, json, c.App.Writer)
		},
	}
	return snapshot
}

func printMain(indexPath string, json bool, out io.Writer) error {
	index, err := readFromOption(indexPath)
	if err != nil {
		return err
	}
	if json {
		pp.BufferFoldThreshold = math.MaxInt

		options := protojson.MarshalOptions{}

		jsonBytes, err := options.Marshal(index)
		out.Write(jsonBytes)
		return err
	} else {
		prettyPrinter := pp.New()
		prettyPrinter.SetExportedOnly(true)
		prettyPrinter.SetOutput(out)
		_, err = prettyPrinter.Print(index)
		return err
	}
}
