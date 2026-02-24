package repro

import (
	sitter "github.com/tree-sitter/go-tree-sitter"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

type reproSourceFile struct {
	Source        *scip.SourceFile
	node          *sitter.Node
	tree          *sitter.Tree
	definitions   []*definitionStatement
	references    []*referenceStatement
	relationships []*relationshipsStatement
	localScope    *reproScope
}

func newSourceFile(sourceFile *scip.SourceFile, node *sitter.Node, tree *sitter.Tree) *reproSourceFile {
	return &reproSourceFile{
		Source:      sourceFile,
		node:        node,
		tree:        tree,
		definitions: nil,
		references:  nil,
		localScope:  newScope(),
	}
}

func (s *reproSourceFile) nodeText(n *sitter.Node) string {
	return s.Source.Text[n.StartByte():n.EndByte()]
}
