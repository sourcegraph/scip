package scip

import (
	"strings"

	"github.com/sourcegraph/beaut"
)

// IsGlobalSymbol returns true if the symbol is obviously not a local symbol.
//
// CAUTION: Does not perform full validation of the symbol string's contents.
func IsGlobalSymbol(symbol string) bool {
	return !IsLocalSymbol(symbol)
}

// IsLocalSymbol returns true if the symbol is obviously not a global symbol.
//
// CAUTION: Does not perform full validation of the symbol string's contents.
func IsLocalSymbol(symbol string) bool {
	return strings.HasPrefix(symbol, "local ")
}

// ParseSymbol parses an SCIP string into the Symbol message.
//
// Prefer using ParseSymbolUTF8 for strings already known to
// be valid UTF-8 encoded strings. For example, the Protobuf
// string type is guaranteed to be converted to a UTF-8 string
// in Go, you can avoid an extra UTF-8 validity check with
// this API.
func ParseSymbol(symbol string) (*Symbol, error) {
	s, err := beaut.NewUTF8String(symbol)
	if err != nil {
		return nil, err
	}
	return ParseSymbolUTF8(s)
}

// ParseSymbolUTF8 parses an SCIP string into the Symbol message.
//
// Unlike ParseSymbol, this skips UTF-8 validation. To customize
// parsing behavior, use ParseSymbolUTF8With.
func ParseSymbolUTF8(symbol beaut.UTF8String) (*Symbol, error) {
	s := Symbol{}
	err := ParseSymbolUTF8With(symbol, ParseSymbolOptions{IncludeDescriptors: true, RecordOutput: &s})
	return &s, err
}

type emptySymbolError struct{}

func (emptySymbolError) Error() string {
	return "empty symbol"
}

type ParseSymbolOptions struct {
	// IncludeDescriptors indicates whether the the descriptors in the symbol should also be
	// parsed. This setting is only respected for global symbols.
	IncludeDescriptors bool
	// RecordOutput, if provided, is used to record the output of the symbol parser.
	//
	// Otherwise, only validation is performed without any extraneous heap
	// allocations (except for optimization misses by the Go compiler).
	RecordOutput *Symbol
}

func ParseSymbolUTF8With(symbol beaut.UTF8String, options ParseSymbolOptions) error {
	if symbol.Len() == 0 {
		return emptySymbolError{}
	}
	return parseSymbolV2(symbol, options.IncludeDescriptors, options.RecordOutput)
}

func ValidateSymbolUTF8(symbol beaut.UTF8String) error {
	return ParseSymbolUTF8With(symbol, ParseSymbolOptions{IncludeDescriptors: true, RecordOutput: nil})
}
