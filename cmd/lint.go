package main

import (
	"fmt"
	"sort"

	"github.com/urfave/cli/v2"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/sourcegraph/lib/errors"
)

func lintCommand() cli.Command {
	snapshot := cli.Command{
		Name:  "lint",
		Usage: "Flag potential issues with a SCIP index",
		Description: "Example usage:\n\n  scip lint /path/to/index.scip\n\n" +
			"You may want to filter the output using `grep -v <pattern>`\n" +
			"to narrow down on certain classes of errors.",
		Action: func(c *cli.Context) error {
			indexPath := c.Args().Get(0)
			if indexPath == "" {
				return errors.New("missing argument for path to SCIP index")
			}
			return lintMain(indexPath)
		},
	}
	return snapshot
}

func lintMain(indexPath string) error {
	scipIndex, err := readFromOption(indexPath)
	if err != nil {
		return err
	}

	symTable := newSymbolTable()

	var errs errorSet

	for _, extSym := range scipIndex.ExternalSymbols {
		if extSym.Symbol == "" {
			errs.Add(emptyStringError{what: "symbol", context: "external symbols"})
		} else if !symTable.extSyms.Add(extSym.Symbol) {
			errs.Add(duplicateSymbolInfoWarning{symbol: extSym.Symbol})
		}
	}

	docMap := map[string]*scip.Document{}
	for _, doc := range scipIndex.Documents {
		if doc.RelativePath == "" {
			errs.Add(emptyStringError{what: "document", context: "index"})
			errs.Add(note{"empty documents will be skipped for diagnostics"})
			continue
		}
		if _, ok := docMap[doc.RelativePath]; ok {
			errs.Add(duplicateDocumentWarning{path: doc.RelativePath})
			errs.Add(note{"out of documents with identical paths, all but one will be skipped for diagnostics"})
		} else {
			docMap[doc.RelativePath] = doc
		}
	}

	for path, doc := range docMap {
		for _, sym := range doc.Symbols {
			if err := symTable.addFileForSymbol(sym.Symbol, path); err != nil {
				errs.Add(err)
			}
		}
		for _, sym := range doc.Symbols {
			for _, rel := range sym.Relationships {
				// This has to run in a second pass so that all symbols are first populated.
				if err := symTable.addRelationship(sym.Symbol, path, rel); err != nil {
					errs.Add(err)
				}
			}
		}
	}

	for _, extSym := range scipIndex.ExternalSymbols {
		for _, rel := range extSym.Relationships {
			if err := symTable.addRelationshipForExternalSymbol(extSym.Symbol, rel); err != nil {
				errs.Add(err)
			}
		}
	}

	for path, doc := range docMap {
		for _, occ := range doc.Occurrences {
			if err := symTable.addOccurrence(path, occ); err != nil {
				errs.Add(err)
			}
		}
	}

	var errOut errors.MultiError
	errOut = errors.Append(errOut, errs.Unique()...)
	return errOut
}

// --- Main types ---

type occurrenceKey struct {
	loc   scip.Range
	roles int32
}

func scipOccurrenceKey(occ *scip.Occurrence) occurrenceKey {
	return occurrenceKey{*scip.NewRange(occ.Range), occ.SymbolRoles}
}

type occurrenceMap = map[occurrenceKey]*scip.Occurrence

type fileOccurrenceMap = map[string]occurrenceMap

type symbolTable struct {
	extSyms      set[string]
	localSymsMap map[string]fileOccurrenceMap
	relsMap      set[pair[string]]
}

func newSymbolTable() symbolTable {
	return symbolTable{
		newSet[string](),
		map[string]fileOccurrenceMap{},
		newSet[pair[string]](),
	}
}

func (st *symbolTable) addFileForSymbol(sym string, path string) error {
	if sym == "" {
		return emptyStringError{what: "symbol", context: fmt.Sprintf("symbols for document %s", path)}
	}
	if st.extSyms.Contains(sym) {
		return bothLocalAndExternalSymbolError{sym, path}
	}
	if occsForSym, ok := st.localSymsMap[sym]; ok {
		if _, ok := occsForSym[path]; ok {
			return duplicateSymbolInfoWarning{symbol: sym, path: path}
		} else {
			occsForSym[path] = occurrenceMap{}
		}
	} else {
		st.localSymsMap[sym] = fileOccurrenceMap{path: {}}
	}
	return nil
}

func (st *symbolTable) addRelationshipForExternalSymbol(sym string, rel *scip.Relationship) error {
	if sym == "" { // Errors for this are emitted earlier
		return nil
	}
	if rel.Symbol == "" {
		return emptyStringError{what: "symbol", context: fmt.Sprintf("relationships for external symbol %s", sym)}
	}
	if !rel.IsDefinition && !rel.IsReference && !rel.IsImplementation && !rel.IsTypeDefinition {
		return missingRelationshipFlagError{sym, "external symbols"}
	}
	if !st.extSyms.Contains(rel.Symbol) {
		return missingSymbolInRelationshipError{sym, "external symbols", rel.Symbol, "external symbols"}
	}
	relPair := pair[string]{sym, rel.Symbol}
	if st.relsMap.Contains(relPair) {
		return multipleRelationshipWarning{sym, rel.Symbol}
	}
	st.relsMap.Add(relPair)
	return nil
}

func (st *symbolTable) addRelationship(sym string, path string, rel *scip.Relationship) error {
	if sym == "" { // Errors for this are emitted earlier
		return nil
	}
	if rel.Symbol == "" {
		return emptyStringError{what: "symbol", context: fmt.Sprintf("relationships for %s", sym)}
	}
	if !rel.IsDefinition && !rel.IsReference && !rel.IsImplementation && !rel.IsTypeDefinition {
		return missingRelationshipFlagError{sym, fmt.Sprintf("symbols for file %s", path)}
	}
	if !st.extSyms.Contains(rel.Symbol) {
		if _, ok := st.localSymsMap[rel.Symbol]; !ok {
			return missingSymbolInRelationshipError{sym, fmt.Sprintf("symbols for file %s", path), rel.Symbol, "external symbols or some other file"}
		}
	}
	relPair := pair[string]{sym, rel.Symbol}
	if st.relsMap.Contains(relPair) {
		return multipleRelationshipWarning{sym, rel.Symbol}
	}
	st.relsMap.Add(relPair)
	return nil
}

func (st *symbolTable) addOccurrence(path string, occ *scip.Occurrence) error {
	if occ.Symbol == "" {
		return emptyStringError{what: "symbol", context: fmt.Sprintf("occurrence at %s @ %s", path, scipRangeToString(*scip.NewRange(occ.Range)))}
	}
	if st.extSyms.Contains(occ.Symbol) {
		return nil
	}
	if occMap, ok := st.localSymsMap[occ.Symbol]; ok {
		occKey := scipOccurrenceKey(occ)
		if occs, ok := occMap[path]; ok {
			if matchingOcc, ok := occs[occKey]; ok {
				return duplicateOccurrenceWarning{matchingOcc, occ, path}
			} else {
				occs[occKey] = occ
			}
		} else {
			// We're seeing an occurrence for a symbol in a file
			// other than the one it was defined in.
			occMap[path] = occurrenceMap{occKey: occ}
		}
	} else {
		return missingSymbolForOccurrenceError{occ.Symbol, path, *scip.NewRange(occ.Range)}
	}
	return nil
}

// --- SCIP related utilities ---

func scipRangeToString(r scip.Range) string {
	return fmt.Sprintf("%d:%d-%d:%d", r.Start.Line, r.Start.Character, r.End.Line, r.End.Character)
}

// --- All possible errors ---

type duplicateSymbolInfoWarning struct {
	symbol string
	// path may be empty for external symbols
	path string
}

func (e duplicateSymbolInfoWarning) Error() string {
	if e.path == "" {
		return fmt.Sprintf("warning: found repeated SymbolInformation for '%s' in '%s'", e.symbol, e.path)
	}
	return fmt.Sprintf("warning: found repeated SymbolInformation for external symbol '%s'", e.symbol)
}

type emptyStringError struct {
	what    string
	context string
}

func (e emptyStringError) Error() string {
	return fmt.Sprintf("error: found empty %s in %s", e.what, e.context)
}

type duplicateDocumentWarning struct {
	path string
}

func (e duplicateDocumentWarning) Error() string {
	return fmt.Sprintf("warning: found multiple documents with path '%s' in index", e.path)
}

type bothLocalAndExternalSymbolError struct {
	symbol string
	path   string
}

func (e bothLocalAndExternalSymbolError) Error() string {
	return fmt.Sprintf("error: SymbolInformation for '%s'"+
		" is present in both external symbols and document '%s'", e.symbol, e.path)
}

type missingRelationshipFlagError struct {
	symbol  string
	context string
}

func (e missingRelationshipFlagError) Error() string {
	return fmt.Sprintf("error: at least one of is_definition,"+
		" is_reference, is_type_definition or is_implementation should"+
		" be set for symbol '%s' in %s", e.symbol, e.context)
}

type missingSymbolInRelationshipError struct {
	symbol                       string
	symbolContext                string
	relatedSymbol                string
	expectedRelatedSymbolContext string
}

func (e missingSymbolInRelationshipError) Error() string {
	return fmt.Sprintf("error: symbol '%s' (#1) (in %s) has"+
		" a relationship to '%s' (#2), but couldn't find #2 in %s",
		e.symbol, e.symbolContext, e.relatedSymbol, e.expectedRelatedSymbolContext)
}

type multipleRelationshipWarning struct {
	symbol        string
	relatedSymbol string
}

func (e multipleRelationshipWarning) Error() string {
	return fmt.Sprintf("warning: found multiple relationships from"+
		" '%s' to '%s', which could optimized into a single relationship", e.symbol, e.relatedSymbol)
}

type missingSymbolForOccurrenceError struct {
	symbol string
	path   string
	occ    scip.Range
}

func (e missingSymbolForOccurrenceError) Error() string {
	return fmt.Sprintf("error: found occurrence at %s @ %s"+
		" for symbol %s, but there is no matching SymbolInformation"+
		" in external symbols or any document", e.path, scipRangeToString(e.occ), e.symbol)
}

type duplicateOccurrenceWarning struct {
	occ1 *scip.Occurrence
	occ2 *scip.Occurrence
	path string
}

func (e duplicateOccurrenceWarning) Error() string {
	return fmt.Sprintf("warning: found duplicate occurrence for %s at %s @ %s with role %d",
		e.occ1.Symbol, e.path, scipRangeToString(*scip.NewRange(e.occ1.Range)), e.occ1.SymbolRoles)
}

type note struct {
	message string
}

func (n note) Error() string {
	return fmt.Sprintf("note: %s", n.message)
}

// --- Miscellaneous utility types ---

type errorSet struct {
	data []error
}

func (e *errorSet) Add(err error) {
	e.data = append(e.data, err)
}

func (e *errorSet) Unique() []error {
	m := map[string]error{}
	for _, e := range e.data {
		m[e.Error()] = e
	}
	var out []error
	for _, e := range m {
		out = append(out, e)
	}
	sort.Sort(mySlice[error]{out, func(e1 error, e2 error) bool {
		return e1.Error() < e2.Error()
	}})
	return out
}

type mySlice[T any] struct {
	data []T
	cmp  func(T, T) bool
}

func (s mySlice[T]) Len() int {
	return len(s.data)
}
func (s mySlice[T]) Swap(i int, j int) {
	s.data[i], s.data[j] = s.data[j], s.data[i]
}
func (s mySlice[T]) Less(i int, j int) bool {
	return s.cmp(s.data[i], s.data[j])
}

type set[T comparable] struct {
	impl map[T]struct{}
}

func newSet[T comparable]() set[T] {
	return set[T]{impl: map[T]struct{}{}}
}

func (s *set[T]) Add(t T) bool {
	if _, ok := s.impl[t]; ok {
		return false
	}
	s.impl[t] = struct{}{}
	return true
}

func (s *set[T]) Contains(t T) bool {
	_, ok := s.impl[t]
	return ok
}

type pair[T any] struct {
	first  T
	second T
}
