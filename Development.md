# Developing SCIP

## Project structure

- [bindings/](./bindings/): Contains a mix of generated and hand-written
  bindings for different languages.
- [cmd/](./cmd/): CLI for SCIP.
- [docs/](./docs/): Auto-generated documentation.
- [reprolang/](./reprolang/): A verbose, small language which consists
  of declarations, references, imports and other minor bits of functionality,
  which is used to test the SCIP CLI. The language is defined using a
  [tree-sitter grammar](./reprolang/grammar.js).
  This functionality not meant for use outside of this repository.

## Code generation

1. Regenerating definitions after changing the schema in [scip.proto](./scip.proto).
   ```
   ./dev/proto-generate.sh
   ```
2. Regenerating snapshots after making changes to the CLI.
   ```
   go test ./cmd -update-snapshots
   ```
3. Regenerating parser for Repro after editing its grammar.
   ```
   cd reprolang
   ./generate-tree-sitter-parser.sh
   ```
