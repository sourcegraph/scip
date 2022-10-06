package main

import (
	_ "embed"
	"fmt"
	"log"
	"os"
	"runtime/debug"
	"strings"

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
	lint := lintCommand()
	print := printCommand()
	snapshot := snapshotCommand()
	stats := statsCommand()
	return []*cli.Command{&convert, &lint, &print, &snapshot, &stats}
}

//go:embed version.txt
var version string

var Reproducible = "" // set by ldflags in CI

func gitSuffix() string {
	if Reproducible != "" {
		return ""
	}
	var rev, timestamp string
	clean := "true"
	if buildInfo, ok := debug.ReadBuildInfo(); ok {
		for _, kv := range buildInfo.Settings {
			switch kv.Key {
			case "vcs.revision":
				rev = kv.Value
			case "vcs.time":
				timestamp = kv.Value
			case "vcs.modified":
				if kv.Value == "true" {
					clean = "false"
				}
			}
		}
	}
	return fmt.Sprintf("-dev\nSHA: %s\ntimestamp: %s\nclean: %s", rev, timestamp, clean)
}

func scipApp() *cli.App {
	app := &cli.App{
		Name:        "scip",
		Version:     fmt.Sprintf("v%s%s", strings.TrimSpace(version), gitSuffix()),
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
