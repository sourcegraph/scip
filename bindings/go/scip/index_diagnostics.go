package scip

import "fmt"

type IndexDiagnosticType int

const (
	ExportedSymbolsWithNoDefinition IndexDiagnosticType = iota
)

type IndexDiagnostic interface {
	// Key returns a unique key for this diagnostic. It allows for easy deduplication with a Map
	Key() string

	// DiagnosticType returns the index type. Can be used to switch case over different types
	// if we wanted to do anything special with them.
	DiagnosticType() IndexDiagnosticType

	// Message to display to user if calling code wants to display any information
	Message() string
}

// NoSymbolDefinitionDiagnostic is used when a Symbol was exported by a document,
// but there was no corresponding definition occurrence in the document.
//
// We discard these symbols in the indexer, but with this we can warn the user as well.
type NoSymbolDefinitionDiagnostic struct {
	symbol *SymbolInformation
}

func (NoSymbolDefinitionDiagnostic) DiagnosticType() IndexDiagnosticType {
	return ExportedSymbolsWithNoDefinition
}
func (diag NoSymbolDefinitionDiagnostic) Message() string {
	return fmt.Sprintf("No Definition For Exported Symbol: %s", diag.symbol.Symbol)
}
func (diag NoSymbolDefinitionDiagnostic) Key() string {
	return fmt.Sprintf("%d:%s", diag.DiagnosticType(), diag.symbol.Symbol)
}
