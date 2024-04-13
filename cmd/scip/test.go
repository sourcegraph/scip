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

			testCasesAtLine := testCasesForLine(lineNumber, lines, flags.commentSyntax)

			// if the test file contains no test lines, skip it. Only test the lines
			// that the test file dictates should be tested
			if len(testCasesAtLine) == 0 {
				continue
			}

			attributes := attributesForOccurrencesAtLine(lineNumber, document.Occurrences)
			for _, testCase := range testCasesAtLine {
				if !isValidTestCase(testCase, attributes) {
					fmt.Println("Invalid Line:")
					fmt.Printf("  Actual: '%s'\n", testCase.attribute.data)
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

	// any additional information necessary to represent this attribute
	// each line should be considered a "newline", and is used for multiline
	// comments (in documentation), and diagnostic information
	additionalData []string
}

// symbolAttributeTestCase refers to metadata used to validate
// [symbolAttributes]
type symbolAttributeTestCase struct {
	attribute     *symbolAttribute
	enforceLength bool
}

// commentsForLine returns the list of lines, after a provided [lineNumber], which are
// classified as comment. The comment type can be configured using [commentSyntax]
func testCasesForLine(lineNumber int, lines []string, commentSyntax string) []*symbolAttributeTestCase {
	testCases := []*symbolAttributeTestCase{}

	if lineNumber >= len(lines)-1 {
		return testCases
	}

	testLines := []*symbolAttributeTestCase{}
	for i := lineNumber + 1; i < len(lines); i++ {
		line := lines[i]
		if strings.HasPrefix(strings.TrimSpace(line), commentSyntax) {
			testLines = append(testLines, parseTestCase(line, lines[i:], commentSyntax))
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

			start := int(pos.Start.Character)
			length := int(pos.End.Character - pos.Start.Character)

			kind := "reference"
			if scip.SymbolRole_Definition.Matches(occ) {
				kind = "definition"
			} else if scip.SymbolRole_ForwardDefinition.Matches(occ) {
				kind = "forward_definition"
			}
			result = append(result, &symbolAttribute{
				start:          start,
				length:         length,
				kind:           kind,
				data:           occ.Symbol,
				additionalData: []string{},
			})

			for _, diagnostic := range occ.Diagnostics {
				result = append(result, &symbolAttribute{
					start:  start,
					length: length,
					kind:   "diagnostic",
					data:   diagnostic.Severity.String(),
					additionalData: []string{
						diagnostic.Message,
					},
				})
			}
		}
	}
	return result
}

func parseTestCase(line string, leadingLines []string, commentSyntax string) *symbolAttributeTestCase {
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

	additionalData := []string{}
	i := 0
	for i < len(leadingLines) {
		leadingLine := leadingLines[i]
		multilinePrefix := fmt.Sprintf("%s >", commentSyntax)
		if strings.Contains(leadingLine, multilinePrefix) {
			additionalData = append(
				additionalData,
				strings.TrimSpace(strings.Replace(leadingLine, multilinePrefix, "", 1)),
			)
			i++
		} else {
			break
		}
	}

	return &symbolAttributeTestCase{
		attribute: &symbolAttribute{
			kind:           kind,
			start:          start,
			length:         length,
			data:           data,
			additionalData: additionalData,
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
