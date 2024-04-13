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
		for lineNumber := range lines {

			testsAtLine := commentsForLine(lineNumber, lines, flags.commentSyntax)

			// if the test file contains no test lines, skip it. Only test the lines
			// that the test file dictates should be tested
			if len(testsAtLine) == 0 {
				continue
			}

			attributes := attributesForOccurrencesAtLine(lineNumber, document.Occurrences)
			for _, testLine := range testsAtLine {
				testCase := parseTestCase(testLine, flags.commentSyntax)
				if !isValidTestCase(testCase, attributes) {
					fmt.Println("Invalid Line:")
					fmt.Printf("  Actual: '%s'\n", testLine)
					fmt.Println("  Expected (one of):")
					for _, attr := range attributes {
						fmt.Printf("    - '%s'\n", attr.data)
					}
				}
			}
		}
	}
	return nil
}

// symbolAttribute refers to a single attribute of a symbol.
// This can be a definition, reference, documentation, or diagnostic
type symbolAttribute struct {
	// the column number where this symbol starts
	start int

	// the length of the symbol's name
	length int

	// the type of attribute that this is
	kind string

	// contextual information about the attribute, as determined
	// by the [kind]
	data string
}

// symbolAttributeTestCase refers to metadata used to validate
// [symbolAttributes]
type symbolAttributeTestCase struct {
	attribute     *symbolAttribute
	enforceLength bool
}

// commentsForLine returns the list of lines, after a provided [lineNumber], which are
// classified as comment. The comment type can be configured using [commentSyntax]
func commentsForLine(lineNumber int, lines []string, commentSyntax string) []string {
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

func attributesForOccurrencesAtLine(lineNumber int, occurrences []*scip.Occurrence) []*symbolAttribute {
	result := []*symbolAttribute{}
	for _, occ := range occurrences {
		if occ.Range[0] == int32(lineNumber) {
			pos := scip.NewRange(occ.Range)

			kind := "reference"
			if scip.SymbolRole_Definition.Matches(occ) {
				kind = "definition"
			} else if scip.SymbolRole_ForwardDefinition.Matches(occ) {
				kind = "forward_definition"
			}

			result = append(result, &symbolAttribute{
				start:  int(pos.Start.Character),
				length: int(pos.End.Character - pos.Start.Character),
				kind:   kind,
				data:   occ.Symbol,
			})
		}
	}
	return result
}

func parseTestCase(line string, commentSyntax string) *symbolAttributeTestCase {
	start := 0
	length := 0
	enforceLength := false

	if strings.Contains(line, "<-") {
		// if the test line selects via `<-`, treat the symbol selection
		// as the location of the commentSyntax
		start = strings.Index(line, commentSyntax)
		line = strings.Replace(line, "<-", "", 1)
	} else {
		// otherwise treat the start as the first `^`
		start = strings.Index(line, "^")

		// a single `^` dictates no length enforcement
		// anything more signifies length should be verified
		if strings.Contains(line, "^^") {
			enforceLength = true
			length = charCountInString(line, '^')
		}
		line = strings.ReplaceAll(line, "^", "")
	}

	// remove the comment prefix & whitespace
	line = strings.TrimSpace(strings.Replace(line, commentSyntax, "", 1))

	// the type of the symbol should be the first word
	// this is "definition", "reference", "documentation", "diagnostic", etc..
	kind := strings.Split(line, " ")[0]

	// the data is everything except the type
	data := strings.TrimSpace(strings.Replace(line, kind, "", 1))

	return &symbolAttributeTestCase{
		attribute: &symbolAttribute{
			kind:   kind,
			data:   data,
			start:  start,
			length: length,
		},
		enforceLength: enforceLength,
	}
}

func isValidTestCase(testCase *symbolAttributeTestCase, attributes []*symbolAttribute) bool {
	for _, attr := range attributes {
		if isValidTestCaseForAttribute(testCase, attr) {
			return true
		}
	}
	return false
}

func isValidTestCaseForAttribute(testCase *symbolAttributeTestCase, attr *symbolAttribute) bool {
	if testCase.attribute.start != attr.start {
		return false
	}

	if testCase.enforceLength && testCase.attribute.length != attr.length {
		return false
	}

	if testCase.attribute.kind != attr.kind {
		return false
	}

	return testCase.attribute.data == attr.data
}

func charCountInString(s string, char rune) int {
	count := 0
	for _, ch := range s {
		if ch == char {
			count++
		}
	}
	return count
}
