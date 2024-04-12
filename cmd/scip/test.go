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

func findOccurrencesForLine(lineNumber int, occurrences []*scip.Occurrence) []*scip.Occurrence {
	result := []*scip.Occurrence{}
	for _, occ := range occurrences {
		if occ.Range[0] == int32(lineNumber) {
			result = append(result, occ)
		}
	}
	return result
}

func findTestsAtLine(lineNumber int, lines []string, commentSyntax string) []string {
	if lineNumber >= len(lines)-1 {
		return []string{}
	}

	testLines := []string{}
	for i := lineNumber + 1; i < len(lines); i++ {
		line := lines[i]
		if strings.HasPrefix(strings.TrimSpace(line), commentSyntax) {
			testLines = append(testLines, line)
		} else {
			// For the first line that isn't a comment, break
			break
		}
	}

	return testLines
}

type testLine struct {
	symbol        string
	role          string
	start         int
	length        int
	enforceLength bool
}

func parseTestLine(line string, commentSyntax string) *testLine {
	start := 0
	length := 0
	enforceLength := false

	if strings.Contains(line, "<-") {
		start = strings.Index(line, commentSyntax)
		line = strings.Replace(line, "<-", "", 1)
	} else {
		start = strings.Index(line, "^")

		if strings.Contains(line, "^^") {
			enforceLength = true
			length = countOccurrences(line, '^')
		}
		line = strings.ReplaceAll(line, "^", "")
	}

	// remove the comment prefix & whitespace
	line = strings.TrimSpace(strings.Replace(line, commentSyntax, "", 1))

	role := strings.Split(line, " ")[0]
	symbol := strings.TrimSpace(strings.Replace(line, role, "", 1))

	return &testLine{
		symbol:        symbol,
		role:          role,
		start:         start,
		length:        length,
		enforceLength: enforceLength,
	}
}

func roleFromOccurrence(occ *scip.Occurrence) string {
	if scip.SymbolRole_Definition.Matches(occ) {
		return "definition"
	} else if scip.SymbolRole_ForwardDefinition.Matches(occ) {
		return "forward_definition"
	}
	return "reference"
}

func isValidTestLine(parsedTestLine *testLine, occurrences []*scip.Occurrence) bool {
	for _, occ := range occurrences {
		if parsedTestLine.symbol != occ.Symbol {
			continue
		}

		if parsedTestLine.role != roleFromOccurrence(occ) {
			continue
		}

		pos := scip.NewRange(occ.Range)
		if parsedTestLine.enforceLength && parsedTestLine.length != int(pos.End.Character-pos.Start.Character) {
			continue
		}

		if int(pos.Start.Character) > parsedTestLine.start || int(pos.End.Character-1) < parsedTestLine.start {
			continue
		}

		return true
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

			occurrences := findOccurrencesForLine(lineNumber, document.Occurrences)

			for _, testLine := range testsAtLine {
				parsedTestLine := parseTestLine(testLine, flags.commentSyntax)
				if !isValidTestLine(parsedTestLine, occurrences) {
					fmt.Println("Invalid Line:")
					fmt.Printf("  Actual: '%s'\n", testLine)
					fmt.Println("  Expected (one of):")
					for _, occ := range occurrences {
						fmt.Printf("    - '%s'\n", occ.Symbol)
					}
				}
			}
		}
	}
	return nil
}

func countOccurrences(s string, char rune) int {
	count := 0
	for _, ch := range s {
		if ch == char {
			count++
		}
	}
	return count
}
