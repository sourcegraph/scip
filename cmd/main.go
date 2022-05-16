package main

import (
	_ "embed"
	"fmt"
	"os"
	"regexp"

	"github.com/docopt/docopt-go"
)

//go:embed Readme.md
var readme string

func helpText() string {
	usageRegexp := regexp.MustCompile("(?s)<!-- begin usage -->\n\n```\n(.*)\n```\n\n<!-- end usage -->")
	usageText := usageRegexp.FindStringSubmatch(readme)[1]
	return fmt.Sprintf(helpTextTemplate, usageText)
}

const helpTextTemplate string = `Semantic Code Intelligence Protocol CLI.

%s

For more details, see the project README: https://github.com/sourcegraph/scip
`

func bailIfError(err error) {
	if err != nil {
		os.Stderr.WriteString(err.Error())
		os.Exit(1)
	}
}

func main() {
	parsedArgs, err := docopt.ParseDoc(helpText())
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
	if parsedArgs["snapshot"].(bool) {
		bailIfError(snapshotMain(parsedArgs))
		os.Exit(0)
	}
	// Normally, this should be impossible as docopt should properly handle
	// incorrect arguments, but might as well exit nicely. 🤷🏽
	os.Stderr.WriteString(helpText())
	os.Exit(1)
}
