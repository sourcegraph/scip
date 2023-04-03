package scip

// CanonicalizeDocument deterministically re-orders the fields of the given document.
func CanonicalizeDocument(document *Document) *Document {
	document.Occurrences = CanonicalizeOccurrences(document.Occurrences)
	document.Symbols = CanonicalizeSymbols(document.Symbols)
	return SanitizeDocument(document)
}

// CanonicalizeOccurrences deterministically re-orders the fields of the given occurrence slice.
func CanonicalizeOccurrences(occurrences []*Occurrence) []*Occurrence {
	canonicalized := make([]*Occurrence, 0, len(occurrences))
	for _, occurrence := range FlattenOccurrences(occurrences) {
		canonicalized = append(canonicalized, CanonicalizeOccurrence(occurrence))
	}

	return SortOccurrences(canonicalized)
}

// CanonicalizeOccurrence deterministically re-orders the fields of the given occurrence.
func CanonicalizeOccurrence(occurrence *Occurrence) *Occurrence {
	// Express ranges as three-components if possible
	occurrence.Range = NewRange(occurrence.Range).SCIPRange()
	occurrence.Diagnostics = CanonicalizeDiagnostics(occurrence.Diagnostics)
	return occurrence
}

// CanonicalizeDiagnostics deterministically re-orders the fields of the given diagnostic slice.
func CanonicalizeDiagnostics(diagnostics []*Diagnostic) []*Diagnostic {
	canonicalized := make([]*Diagnostic, 0, len(diagnostics))
	for _, diagnostic := range diagnostics {
		canonicalized = append(canonicalized, CanonicalizeDiagnostic(diagnostic))
	}

	return SortDiagnostics(canonicalized)
}

// CanonicalizeDiagnostic deterministically re-orders the fields of the given diagnostic.
func CanonicalizeDiagnostic(diagnostic *Diagnostic) *Diagnostic {
	diagnostic.Tags = SortDiagnosticTags(diagnostic.Tags)
	return diagnostic
}

// CanonicalizeSymbols deterministically re-orders the fields of the given symbols slice.
func CanonicalizeSymbols(symbols []*SymbolInformation) []*SymbolInformation {
	canonicalized := make([]*SymbolInformation, 0, len(symbols))
	for _, symbol := range FlattenSymbols(symbols) {
		canonicalized = append(canonicalized, CanonicalizeSymbol(symbol))
	}

	return SortSymbols(canonicalized)
}

// CanonicalizeSymbol deterministically re-orders the fields of the given symbol.
func CanonicalizeSymbol(symbol *SymbolInformation) *SymbolInformation {
	symbol.Relationships = CanonicalizeRelationships(symbol.Relationships)
	return symbol
}

// CanonicalizeRelationships deterministically re-orders the fields of the given relationship slice.
func CanonicalizeRelationships(relationships []*Relationship) []*Relationship {
	return SortRelationships(FlattenRelationship(relationships))
}
