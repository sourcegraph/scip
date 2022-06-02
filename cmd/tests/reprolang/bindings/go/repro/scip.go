package repro

import (
	"sort"
	"strings"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

func (i *identifier) occurrence(roles scip.SymbolRole) *scip.Occurrence {
	return &scip.Occurrence{
		Range:       i.position.SCIPRange(),
		Symbol:      i.symbol,
		SymbolRoles: int32(roles),
	}
}

func (s *reproSourceFile) symbols() []*scip.SymbolInformation {
	var result []*scip.SymbolInformation
	for _, def := range s.definitions {
		if strings.Index(def.name.value, "NoSymbolInformation") >= 0 {
			continue
		}
		documentation := []string{"signature of " + def.name.value}
		if def.docstring != "" {
			documentation = append(documentation, def.docstring)
		}
		result = append(result, &scip.SymbolInformation{
			Symbol:        def.name.symbol,
			Documentation: documentation,
			Relationships: def.relationships(),
		})
	}
	// Ensure a stable order of relationships
	sort.SliceStable(result, func(i, j int) bool {
		return result[i].Symbol < result[j].Symbol
	})
	return result
}

func (s *reproSourceFile) occurrences() []*scip.Occurrence {
	var result []*scip.Occurrence
	for _, def := range s.definitions {
		result = append(result, def.name.occurrence(scip.SymbolRole_Definition))
		for _, ident := range def.relationIdentifiers() {
			if ident == nil {
				continue
			}
			result = append(result, ident.occurrence(scip.SymbolRole_UnspecifiedSymbolRole))
		}
	}
	for _, ref := range s.references {
		result = append(result, ref.name.occurrence(scip.SymbolRole_UnspecifiedSymbolRole))
	}
	return result
}

func (s *definitionStatement) relationships() []*scip.Relationship {
	bySymbol := map[string]*scip.Relationship{}
	for _, ident := range s.relationIdentifiers() {
		if ident == nil {
			continue
		}
		bySymbol[ident.symbol] = &scip.Relationship{Symbol: ident.symbol}
	}
	if s.implementsRelation != nil {
		bySymbol[s.implementsRelation.symbol].IsImplementation = true
	}
	if s.referencesRelation != nil {
		bySymbol[s.referencesRelation.symbol].IsReference = true
	}
	if s.typeDefinesRelation != nil {
		bySymbol[s.typeDefinesRelation.symbol].IsTypeDefinition = true
	}
	var result []*scip.Relationship
	for _, value := range bySymbol {
		result = append(result, value)
	}
	return result
}
