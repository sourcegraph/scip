package repro

import (
	sitter "github.com/tree-sitter/go-tree-sitter"

	reproGrammar "github.com/sourcegraph/scip/reprolang/grammar"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

func parseSourceFile(source *scip.SourceFile) (*reproSourceFile, error) {
	parser := sitter.NewParser()
	defer parser.Close()
	if err := parser.SetLanguage(sitter.NewLanguage(reproGrammar.Language())); err != nil {
		return nil, err
	}
	tree := parser.Parse([]byte(source.Text), nil)
	reproSource := newSourceFile(source, tree.RootNode(), tree)
	reproSource.loadStatements()
	return reproSource, nil
}

func (s *reproSourceFile) loadStatements() {
	for i := uint(0); i < s.node.ChildCount(); i++ {
		child := s.node.Child(i)
		name := child.ChildByFieldName("name")
		if name == nil {
			continue
		}
		switch child.Kind() {
		case "relationships_statement", "definition_statement":
			docstring := ""
			docstringNode := child.ChildByFieldName("docstring")
			if docstringNode != nil {
				docstring = s.nodeText(docstringNode)[len("# doctring:"):]
			}
			name := newIdentifier(s, child.ChildByFieldName("name"))
			relations := relationships{}
			for i := uint(0); i < child.NamedChildCount(); i++ {
				relation := child.NamedChild(i)
				switch relation.Kind() {
				case "implementation_relation":
					relations.implementsRelation = newIdentifier(s, relation.ChildByFieldName("name"))
				case "type_definition_relation":
					relations.typeDefinesRelation = newIdentifier(s, relation.ChildByFieldName("name"))
				case "references_relation":
					relations.referencesRelation = newIdentifier(s, relation.ChildByFieldName("name"))
				case "defined_by_relation":
					relations.definedByRelation = newIdentifier(s, relation.ChildByFieldName("name"))
				}
			}
			if child.Kind() == "definition_statement" {
				s.definitions = append(s.definitions, &definitionStatement{
					docstring: docstring,
					name:      name,
					relations: relations,
				})
			} else {
				s.relationships = append(s.relationships, &relationshipsStatement{
					name:      name,
					relations: relations,
				})
			}
		case "reference_statement":
			s.references = append(s.references, &referenceStatement{
				name:         newIdentifier(s, child.ChildByFieldName("name")),
				isForwardDef: child.ChildByFieldName("forward_definition") != nil,
			})
		}
	}
}
