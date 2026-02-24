# Reprolang

Reprolang ("reproducible language") is a tiny language designed to produce
SCIP indexes in a fully controlled way. It exists so that SCIP features —
definitions, references, cross-repo navigation, relationships, diagnostics —
can be tested without depending on a real programming language indexer.

A `.repro` file is a sequence of statements that declare symbols and the
relationships between them. The indexer parses these files with a tree-sitter
grammar and emits a complete SCIP index, making it possible to write concise,
deterministic test cases for any SCIP capability.

## Example

```
# Define a symbol and reference it
definition hello().
reference hello().

# Forward reference (reference before definition)
reference forward_definition abc#
definition abc#

# Cross-repo reference
reference global other-repo animal#

# Relationships
definition dog# implements animal#
definition Cat# type_defines animal#
```

## Running tests

```bash
go test ./...
```

Update snapshots after making changes:

```bash
go test ./repro -update-snapshots
```

## Regenerating the parser

Requires `tree-sitter` and `prettier` in PATH (available via `nix develop`):

```bash
./generate-tree-sitter-parser.sh
```
