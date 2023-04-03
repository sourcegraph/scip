package main

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/urfave/cli/v2"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
	"github.com/sourcegraph/sourcegraph/lib/errors"
)

type snapshotFlags struct {
	from          string
	output        string
	strict        bool
	commentSyntax string
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
				Value:       "scip-snapshot",
			},
			&cli.BoolFlag{
				Name:        "strict",
				Usage:       "If true, fail fast on errors",
				Destination: &snapshotFlags.strict,
				Value:       true,
			},
			&cli.StringFlag{
				Name:        "comment-syntax",
				Usage:       "Comment syntax to use for snapshot files",
				Destination: &snapshotFlags.commentSyntax,
				Value:       "//",
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
	symbolFormatter := scip.LenientVerboseSymbolFormatter
	if flags.strict {
		symbolFormatter = scip.VerboseSymbolFormatter
		symbolFormatter.OnError = func(err error) error {
			return errors.Wrap(err, "use --strict=false to ignore this error")
		}
	}
	snapshots, err := testutil.FormatSnapshots(index, flags.commentSyntax, symbolFormatter)
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
