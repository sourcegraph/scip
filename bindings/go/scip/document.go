package scip

func (d *Document) HasDefinition(symbol *SymbolInformation) bool {
	for _, occ := range d.Occurrences {
		if occ.Symbol == symbol.Symbol && SymbolRole_Definition.Matches(occ) {
			return true
		}
	}

	return false
}
