package main

import (
	"fmt"
	"log"
	"os"

	"github.com/urfave/cli/v2"
)

func main() {
	app := scipApp()
	if err := app.Run(os.Args); err != nil {
		log.Fatal(err)
	}
}

func commands() []*cli.Command {
	convert := convertCommand()
	snapshot := snapshotCommand()
	stats := statsCommand()
	return []*cli.Command{&convert, &snapshot, &stats}
}

func scipApp() cli.App {
	var versionFlag bool
	app := cli.App{
		Name:        "scip",
		Usage:       "SCIP Code Intelligence Protocol CLI",
		Description: "For more details, see the project README at:\n\n\thttps://github.com/sourcegraph/scip",
		Flags: []cli.Flag{
			&cli.BoolFlag{
				Name:        "version",
				Usage:       "Print the current version and exit.",
				Destination: &versionFlag,
				Aliases:     []string{"v"},
			},
		},
		Action: func(c *cli.Context) error {
			if versionFlag {
				fmt.Println("0.1.0")
				os.Exit(0)
			}
			// FIXME: What is the right way to print help text and error here?
			return nil
		},
		Commands: commands(),
	}
	return app
}

func fromFlag(storage *string) *cli.StringFlag {
	return &cli.StringFlag{
		Name:        "from",
		Usage:       "Path to SCIP index file",
		Destination: storage,
		DefaultText: "index.scip",
	}
}
