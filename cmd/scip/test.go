package main

import (
	"fmt"
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

func buildSymbolsForOccurrence(lineNumber int, commentSyntax string, occurrences []*scip.Occurrence) []string {
	result := []string{}
	for _, occ := range occurrences {
		if occ.Range[0] == int32(lineNumber) {
			b := strings.Builder{}

			pos := scip.NewRange(occ.Range)
			if !pos.IsSingleLine() {
				continue
			}

			// replace the comment length with whitespace
			b.WriteString(buildIndent(len(commentSyntax)))

			// write whitespace for the indent of the line
			b.WriteString(buildIndent(int(pos.Start.Character) - len(commentSyntax)))
			length := pos.End.Character - pos.Start.Character
			for caret := int32(0); caret < length; caret++ {
				b.WriteRune('^')
			}
			b.WriteRune(' ')

			role := "reference"
			if scip.SymbolRole_Definition.Matches(occ) {
				role = "definition"
			} else if scip.SymbolRole_ForwardDefinition.Matches(occ) {
				role = "forward_definition"
			}
			b.WriteString(role)

			b.WriteRune(' ')

			symbol, err := scip.LenientVerboseSymbolFormatter.Format(occ.Symbol)
			if err != nil {
				fmt.Printf("Error formatting symbol: %s\n", occ.Symbol)
			} else {
				b.WriteString(symbol)
				result = append(result, b.String())
			}
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

func findTestsAtLine(lineNumber int, lines []string, commentSyntax string) []string {
	if lineNumber >= len(lines)-1 {
		return []string{}
	}

	testLines := []string{}
	for i := lineNumber + 1; i < len(lines); i++ {
		line := lines[i]
		if strings.HasPrefix(strings.TrimSpace(line), commentSyntax) {
			line = strings.Replace(line, commentSyntax, buildIndent(len(commentSyntax)), 1)
			testLines = append(testLines, line)
		} else {
			// For the first line that isn't a comment, break
			break
		}
	}

	return testLines
}

func isValidTestLine(line string, symbols []string) bool {
	for _, symbol := range symbols {
		if line == symbol {
			return true
		}
	}
	return false
}

func testMain(directory string, flags testFlags) error {
	index, err := readFromOption(flags.from)
	if err != nil {
		return err
	}

	for _, document := range index.Documents {
		sourceFilePath := filepath.Join(directory, document.RelativePath)

		data, err := os.ReadFile(sourceFilePath)
		if err != nil {
			return err
		}
		lines := strings.Split(string(data), "\n")
		for lineNumber, _ := range lines {

			testsAtLine := findTestsAtLine(lineNumber, lines, flags.commentSyntax)
			if len(testsAtLine) == 0 {
				continue
			}

			symbols := buildSymbolsForOccurrence(lineNumber, flags.commentSyntax, document.Occurrences)

			for _, testLine := range testsAtLine {
				if !isValidTestLine(testLine, symbols) {
					fmt.Println("Invalid Line:")
					fmt.Printf("  Actual: '%s'\n", testLine)
					fmt.Println("  Expected (one of):")
					for _, symbol := range symbols {
						fmt.Printf("    - '%s'\n", symbol)
					}
				}
			}
		}
	}
	return nil
}

func buildIndent(length int) string {
	b := strings.Builder{}
	for i := 0; i < length; i++ {
		b.WriteRune(' ')
	}
	return b.String()
}
