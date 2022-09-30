package main

import (
	"github.com/k0kubun/pp/v3"
	"github.com/urfave/cli/v2"
	"math"

	"github.com/sourcegraph/sourcegraph/lib/errors"
)

func printCommand() cli.Command {
	snapshot := cli.Command{
		Name:  "print",
		Usage: "Print a SCIP index in a human-readable format for debugging",
		Description: `WARNING: The output may change over time.
Do not rely on the output of this command in scripts`,
		Action: func(c *cli.Context) error {
			indexPath := c.Args().Get(0)
			if indexPath == "" {
				return errors.New("missing argument for path to SCIP index")
			}
			return printMain(indexPath)
		},
	}
	return snapshot
}

func printMain(indexPath string) error {
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
