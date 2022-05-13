# Developing SCIP

## Project structure

- [bindings/](./bindings/): Contains a mix of generated and hand-written
  bindings for different languages.
  - The TypeScript and Rust bindings are auto-generated.
  - The Go bindings include protoc-generated code as well as extra
    functionality, such as for converting a SCIP index into an LSIF index.
    This is used by the CLI below as well as the
    [Sourcegraph CLI](https://github.com/sourcegraph/src-cli).
- [cmd/](./cmd/): CLI for SCIP.
  - [cmd/tests/](./cmd/tests/): Test data and packages for SCIP.
    - [cmd/tests/reprolang/](./cmd/tests/reprolang/): A verbose, small language
      which consists of declarations, references, imports and other minor bits
      of functionality, which is used to test the SCIP CLI. The language is
      defined using a [tree-sitter grammar](cmd/tests/reprolang/grammar.js).
      This functionality not meant for use outside of this repository.
- [docs/](./docs/): Auto-generated documentation.

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
   cd cmd/tests/reprolang
   ./generate-tree-sitter-parser.sh
   ```
