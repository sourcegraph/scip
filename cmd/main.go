package main

import (
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
	print := printCommand()
	return []*cli.Command{&convert, &snapshot, &stats, &print}
}

func scipApp() *cli.App {
	app := &cli.App{
		Name:        "scip",
		Version:     "v0.2.1-git",
		Usage:       "SCIP Code Intelligence Protocol CLI",
		Description: "For more details, see the project README at:\n\n\thttps://github.com/sourcegraph/scip",
		Commands:    commands(),
	}
	return app
}

func fromFlag(storage *string) *cli.StringFlag {
	return &cli.StringFlag{
		Name:        "from",
		Usage:       "Path to SCIP index file",
		Destination: storage,
		Value:       "index.scip",
	}
}
