package repro

import (
	"fmt"

	"github.com/cockroachdb/errors"
	"github.com/sourcegraph/scip/bindings/go/scip"
)

// enterGlobalDefinitions inserts the names of the global symbols that are defined in this
// dependency into the provided global scope.
func (d *reproDependency) enterGlobalDefinitions(context *reproContext) error {
	var errs error
	enter := func(file *reproSourceFile, name *identifier) {
		if name.isLocalSymbol() {
			return
		}
		symbol := newGlobalSymbol(d.Package, file, name)
		parsedSymbol, err := scip.ParseSymbol(symbol)
		if err != nil {
			errs = errors.CombineErrors(errs, errors.Wrapf(err, "file: %q", file.Source.AbsolutePath))
			return
		}
		newName := newGlobalName(context.pkg, parsedSymbol)
		context.globalScope.names[newName] = symbol
	}
	for _, file := range d.Sources {
		for _, definition := range file.definitions {
			enter(file, definition.name)
		}
		for _, relationship := range file.relationships {
			enter(file, relationship.name)
		}
	}
	return errs
}

// enterDefinitions inserts the names of the definitions into the appropriate scope (local symbols go into the local scope).
func (s *reproSourceFile) enterDefinitions(context *reproContext) {
	enter := func(name *identifier, defName *identifier) {
		scope := context.globalScope
		if name.isLocalSymbol() {
			scope = s.localScope
		}
		var symbol string
		if name.isLocalSymbol() {
			symbol = fmt.Sprintf("local %s", defName.value[len("local"):])
		} else {
			symbol = newGlobalSymbol(context.pkg, s, defName)
		}
		name.symbol = symbol
		scope.names[name.value] = symbol
	}
	for _, def := range s.definitions {
		enter(def.name, def.name)
	}
	for _, rel := range s.relationships {
		if rel.relations.definedByRelation != nil {
			enter(rel.name, rel.relations.definedByRelation)
		}
	}
}

// resolveReferences updates the .symbol field for all names of reference identifiers.
func (s *reproSourceFile) resolveReferences(context *reproContext) error {
	var err error
	resolveIdents := func(rel relationships) {
		for _, ident := range rel.identifiers() {
			if ident == nil {
				continue
			}
			err = errors.CombineErrors(err, ident.resolveSymbol(s.localScope, context))
		}
	}
	for _, def := range s.definitions {
		resolveIdents(def.relations)
	}
	for _, rel := range s.relationships {
		resolveIdents(rel.relations)
	}
	for _, ref := range s.references {
		err = errors.CombineErrors(err, ref.name.resolveSymbol(s.localScope, context))
	}
	return err
}

// newGlobalSymbol returns an SCIP symbol for the given definition.
func newGlobalSymbol(pkg *scip.Package, document *reproSourceFile, name *identifier) string {
	return fmt.Sprintf(
		"reprolang repro_manager %v %v %v/%v",
		pkg.Name,
		pkg.Version,
		document.Source.RelativePath,
		name.value,
	)
}

// newGlobalName returns the name of a symbol that is used to query the scope.
func newGlobalName(pkg *scip.Package, symbol *scip.Symbol) string {
	formatter := scip.DescriptorOnlyFormatter
	formatter.IncludePackageName = func(name string) bool { return name != pkg.Name }
	return "global " + formatter.FormatSymbol(symbol)
}
