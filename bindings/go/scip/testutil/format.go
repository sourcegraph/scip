package testutil

import (
	"log"
	"net/url"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"github.com/sourcegraph/sourcegraph/lib/errors"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

// FormatSnapshots renders the provided SCIP index into a pretty-printed text format
// that is suitable for snapshot testing.
func FormatSnapshots(
	index *scip.Index,
	commentSyntax string,
	symbolFormatter scip.SymbolFormatter,
	customProjectRoot string,
) ([]*scip.SourceFile, error) {
	var result []*scip.SourceFile
	projectRootUrl, err := url.Parse(index.Metadata.ProjectRoot)
	if err != nil {
		return nil, err
	}

	localSourcesRoot := projectRootUrl.Path
	if customProjectRoot != "" {
		localSourcesRoot = customProjectRoot
	} else if _, err := os.Stat(localSourcesRoot); errors.Is(err, os.ErrNotExist) {
		cwd, _ := os.Getwd()
		log.Printf("Project root [%s] doesn't exist, using current working directory [%s] instead. "+
			"To override this behaviour, use --root=<folder> option directly", projectRootUrl.Path, cwd)
		localSourcesRoot = cwd
	}

	var documentErrors error
	for _, document := range index.Documents {
		sourceFilePath := filepath.Join(localSourcesRoot, document.RelativePath)
		snapshot, err := FormatSnapshot(document, index, commentSyntax, symbolFormatter, sourceFilePath)
		err = symbolFormatter.OnError(err)
		if err != nil {
			documentErrors = errors.CombineErrors(
				documentErrors,
				errors.Wrap(err, document.RelativePath),
			)
		}
		sourceFile := scip.NewSourceFile(sourceFilePath,
			document.RelativePath,
			snapshot,
		)
		result = append(result, sourceFile)
	}
	if documentErrors != nil {
		return nil, documentErrors
	}
	return result, nil
}

// FormatSnapshot renders the provided SCIP index into a pretty-printed text format
// that is suitable for snapshot testing.
func FormatSnapshot(
	document *scip.Document,
	index *scip.Index,
	commentSyntax string,
	formatter scip.SymbolFormatter,
	sourceFilePath string,
) (string, error) {
	b := strings.Builder{}
	data, err := os.ReadFile(sourceFilePath)
	if err != nil {
		return "", err
	}
	symtab := document.SymbolTable()
	sort.SliceStable(document.Occurrences, func(i, j int) bool {
		return isSCIPRangeLess(document.Occurrences[i].Range, document.Occurrences[j].Range)
	})
	var formattingError error
	formatSymbol := func(symbol string) string {
		formatted, err := formatter.Format(symbol)
		if err != nil {
			formattingError = errors.CombineErrors(formattingError, errors.Wrapf(err, symbol))
			return symbol
		}
		return formatted
	}
	i := 0
	for lineNumber, line := range strings.Split(string(data), "\n") {
		line = strings.TrimSuffix(line, "\r")
		b.WriteString(strings.Repeat(" ", len(commentSyntax)))
		b.WriteString(strings.ReplaceAll(line, "\t", " "))
		b.WriteString("\n")
		for i < len(document.Occurrences) && document.Occurrences[i].Range[0] == int32(lineNumber) {
			occ := document.Occurrences[i]
			pos := scip.NewRange(occ.Range)
			if !pos.IsSingleLine() {
				i++
				continue
			}
			b.WriteString(commentSyntax)
			for indent := int32(0); indent < pos.Start.Character; indent++ {
				b.WriteRune(' ')
			}
			length := pos.End.Character - pos.Start.Character
			for caret := int32(0); caret < length; caret++ {
				b.WriteRune('^')
			}
			b.WriteRune(' ')
			role := "reference"
			isDefinition := occ.SymbolRoles&int32(scip.SymbolRole_Definition) > 0
			if isDefinition {
				role = "definition"
			}
			b.WriteString(role)
			b.WriteRune(' ')
			b.WriteString(formatSymbol(occ.Symbol))

			prefix := "\n" + commentSyntax + strings.Repeat(" ", int(pos.Start.Character))

			hasOverrideDocumentation := len(occ.OverrideDocumentation) > 0
			if hasOverrideDocumentation {
				documentation := occ.OverrideDocumentation[0]
				writeDocumentation(&b, documentation, prefix, true)
			}

			if info, ok := symtab[occ.Symbol]; ok && isDefinition {
				for _, documentation := range info.Documentation {
					// At least get the first line of documentation if there is leading whitespace
					documentation = strings.TrimSpace(documentation)
					writeDocumentation(&b, documentation, prefix, false)
				}

				sort.SliceStable(info.Relationships, func(i, j int) bool {
					return info.Relationships[i].Symbol < info.Relationships[j].Symbol
				})
				for _, relationship := range info.Relationships {
					b.WriteString(prefix)
					b.WriteString("relationship ")
					b.WriteString(formatSymbol(relationship.Symbol))
					if relationship.IsImplementation {
						b.WriteString(" implementation")
					}
					if relationship.IsReference {
						b.WriteString(" reference")
					}
					if relationship.IsTypeDefinition {
						b.WriteString(" type_definition")
					}
				}
			}

			b.WriteString("\n")
			i++
		}
	}
	return b.String(), formattingError
}

func writeDocumentation(b *strings.Builder, documentation string, prefix string, override bool) {
	// At least get the first line of documentation if there is leading whitespace
	documentation = strings.TrimSpace(documentation)

	b.WriteString(prefix)
	if override {
		b.WriteString("override_")
	}
	b.WriteString("documentation ")

	truncatedDocumentation := documentation
	newlineIndex := strings.Index(documentation, "\n")
	if newlineIndex >= 0 {
		truncatedDocumentation = documentation[0:newlineIndex]
	}
	b.WriteString(truncatedDocumentation)
}

// isRangeLess compares two SCIP ranges (which are encoded as []int32).
func isSCIPRangeLess(a []int32, b []int32) bool {
	if a[0] != b[0] { // start line
		return a[0] < b[0]
	}
	if a[1] != b[1] { // start character
		return a[1] < b[1]
	}
	if len(a) != len(b) { // is one of these multiline
		return len(a) < len(b)
	}
	if a[2] != b[2] { // end line
		return a[2] < b[2]
	}
	if len(a) == 4 {
		return a[3] < b[3]
	}
	return false
}
