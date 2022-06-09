package main

import (
	"fmt"
	"github.com/urfave/cli/v2"
	"os"
	"path/filepath"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
)

type snapshotFlags struct {
	from   string
	output string
}

func snapshotCommand() cli.Command {
	var snapshotFlags snapshotFlags
	snapshot := cli.Command{
		Name:  "snapshot",
		Usage: "Generate snapshot files for golden testing",
		Description: `The snapshot subcommand generates snapshot files which
can be use for inspecting the output of an index in a
visual way. Occurrences are marked with caret signs (^)
and symbol information.`,
		Flags: []cli.Flag{
			fromFlag(&snapshotFlags.from),
			&cli.StringFlag{
				Name:        "to",
				Usage:       "Path to output directory for snapshot files",
				Destination: &snapshotFlags.output,
				DefaultText: "scip-snapshot",
			},
		},
		Action: func(c *cli.Context) error {
			return snapshotMain(snapshotFlags)
		},
	}
	return snapshot
}

func snapshotMain(flags snapshotFlags) error {
	from := flags.from
	index, err := readFromOption(from)
	if err != nil {
		return err
	}
	output := flags.output
	err = os.RemoveAll(output)
	if err != nil {
		return err
	}
	snapshots, err := testutil.FormatSnapshots(index, "//", scip.VerboseSymbolFormatter)
	if err != nil {
		return err
	}
	for _, snapshot := range snapshots {
		outputPath := filepath.Join(output, snapshot.RelativePath)
		err = os.MkdirAll(filepath.Dir(outputPath), 0755)
		if err != nil {
			return err
		}
		err = os.WriteFile(outputPath, []byte(snapshot.Text), 0755)
		if err != nil {
			return err
		}
	}
	fmt.Println("done: " + output)
	return nil
}
