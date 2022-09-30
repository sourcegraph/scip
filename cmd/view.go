package main

import (
	"github.com/k0kubun/pp/v3"
	"github.com/urfave/cli/v2"
	"math"

	"github.com/sourcegraph/sourcegraph/lib/errors"
)

func viewCommand() cli.Command {
	snapshot := cli.Command{
		Name:  "view",
		Usage: "Print a SCIP index in a human-readable format for debugging",
		Description: `WARNING: The output may change over time.
Do not rely on the output of this command in scripts`,
		ArgsUsage: "Path to SCIP index (or - for stdin)",
		Action: func(c *cli.Context) error {
			indexPath := c.Args().Get(0)
			if indexPath == "" {
				return errors.New("missing argument for path to SCIP index")
			}
			return viewMain(indexPath)
		},
	}
	return snapshot
}

func viewMain(indexPath string) error {
	index, err := readFromOption(indexPath)
	if err != nil {
		return err
	}
	pp.BufferFoldThreshold = math.MaxInt
	prettyPrinter := pp.New()
	prettyPrinter.SetExportedOnly(true)
	_, err = prettyPrinter.Print(index)
	return err
}
