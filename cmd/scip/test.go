package main

import (
	"os"
	"path/filepath"
	"strings"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/urfave/cli/v2"
)

type testFlags struct {
	from          string // default: 'index.scip'
	commentSyntax string // default: '//'
}

func testCommand() cli.Command {
	var testFlags testFlags
	test := cli.Command{
		Name:        "test",
		Usage:       "",
		Description: "",
		Flags: []cli.Flag{
			fromFlag(&testFlags.from),
			commentSyntaxFlag(&testFlags.commentSyntax),
		},
		Action: func(c *cli.Context) error {
			dir := c.Args().Get(0)
			return testMain(dir, testFlags)
		},
	}
	return test
}

func findOccurrencesAtLine(lineNumber int, occurrences []*scip.Occurrence) []*scip.Occurrence {
	result := []*scip.Occurrence{}
	for _, occurrence := range occurrences {
		if occurrence.Range[0] == int32(lineNumber) {
			result = append(result, occurrence)
		}
	}
	return result
}

func formatOccurrence(occurrence *scip.Occurrence, formatter scip.SymbolFormatter) (string, error) {
	b := strings.Builder{}

	role := "reference"
	if scip.SymbolRole_Definition.Matches(occurrence) {
		role = "definition"
	} else if scip.SymbolRole_ForwardDefinition.Matches(occurrence) {
		role = "forward_definition"
	}
	b.WriteString(role)

	b.WriteRune(' ')

	symbol, err := formatter.Format(occurrence.Symbol)
	if err != nil {
		return "", err
	}
	b.WriteString(symbol)

	return b.String(), nil
}

func testMain(directory string, flags testFlags) error {
	index, err := readFromOption(flags.from)
	if err != nil {
		return err
	}

	for _, document := range index.Documents {
		sourceFilePath := filepath.Join(directory, document.RelativePath)
		symtab := document.SymbolTable()

		data, err := os.ReadFile(sourceFilePath)
		if err != nil {
			return err
		}

		for lineNumber, line := range strings.Split(string(data), "\n") {
			line = strings.TrimSuffix(line, "\r")

			if strings.HasPrefix(strings.TrimSpace(line), flags.commentSyntax) {
				occurrences := findOccurrencesAtLine(lineNumber, document.Occurrences)

			}

			// for i < len(document.Occurrences) && document.Occurrences[i].Range[0] == int32(lineNumber) {

			// }
		}
	}

	// snapshots, err := testutil.FormatSnapshots(index, flags.commentSyntax, scip.LenientVerboseSymbolFormatter, directory)
	// if err != nil {
	// 	return err
	// }

	// for _, snapshot := range snapshots {
	// 	sourceFilePath := filepath.Join(directory, snapshot.RelativePath)
	// 	data, err := os.ReadFile(sourceFilePath)
	// 	if err != nil {
	// 		return err
	// 	}

	// 	for lineNumber, line := range strings.Split(string(data), "\n") {
	// 		line = strings.TrimSuffix(line, "\r")
	// 		if strings.HasPrefix(strings.TrimSpace(line), flags.commentSyntax) {
	// 			if snapshot.Lines[lineNumber] != line {
	// 				fmt.Printf("ERROR %s: %d", sourceFilePath, lineNumber)
	// 				fmt.Printf("  %s", snapshot.Lines[lineNumber])
	// 			}
	// 		}
	// 	}
	// }

	return nil
}
