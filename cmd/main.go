package main

import (
	"fmt"
	"os"

	"github.com/docopt/docopt-go"
)

const helpText string = `Semantic Code Intelligence Protocol CLI.

Usage:
  scip convert [--from=<path>] [--to=<path>]
  scip --version
  scip -h | --help

Options:
  --from=<path>  Input file for conversion [default: index.scip].
  --to=<path>    Output file for conversion [default: dump.lsif].
  --version      Show version.
  -h --help      Show help text.

A single dash path ('-') for --from (--to) is interpreted as stdin (stdout).

The 'convert' subcommand currently only supports conversion from SCIP to LSIF.

For more details, see the project README: https://github.com/sourcegraph/scip
`

func bailIfError(err error) {
	if err != nil {
		os.Stderr.WriteString(err.Error())
		os.Exit(1)
	}
}

func main() {
	parsedArgs, err := docopt.ParseDoc(helpText)
	bailIfError(err)
	// --help is handled by docopt
	if parsedArgs["--version"].(bool) {
		fmt.Println("0.1.0")
		os.Exit(0)
	}
	if parsedArgs["convert"].(bool) {
		bailIfError(convertMain(parsedArgs))
		os.Exit(0)
	}
	// Normally, this should be impossible as docopt should properly handle
	// incorrect arguments, but might as well exit nicely. 🤷🏽
	os.Stderr.WriteString(helpText)
	os.Exit(1)
}
