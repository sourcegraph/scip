# Developing SCIP

## Project structure

- [bindings/](./bindings/): Contains a mix of generated and hand-written
  bindings for different languages.
  - The TypeScript, Rust and Haskell bindings are auto-generated.
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
   For the Haskell bindings, see `bindings/haskell/README.md`.
2. Regenerating snapshots after making changes to the CLI.
   ```
   go test ./cmd -update-snapshots
   ```
3. Regenerating parser for Repro after editing its grammar.
   ```
   cd cmd/tests/reprolang
   ./generate-tree-sitter-parser.sh
   ```

## Debugging

Protobuf output can be inspected using `scip print`:

```
scip print /path/to/index.scip
```

This may be a bit verbose. The default Protobuf output is more compact,
and can be inspected using `protoc`:

```
protoc --decode=scip.Index -I /path/to/scip scip.proto < index.scip
```

There is also a `lint` subcommand which performs various well-formedness
checks on a SCIP index. It is meant primarily for people working on a SCIP indexer,
and is not recommended for use in other settings.

```
scip lint /path/to/index.scip
```

## Testing and adding new SCIP semantics

It is helpful to use reprolang to check the existing code navigation behavior,
to design new code navigation behavior,
or to investigate the effect of the SCIP to LSIF desugaring.
The LSIF index for reprolang code is much smaller,
which aids debugging.

To do this, add a test file (and implement any new functionality) first.
Then, regenerate the LSIF index with absolute paths.

```bash
go test ./cmd -update-snapshots -debug-snapshot-abspaths
```

The LSIF index can be uploaded to a local Sourcegraph instance using:

```bash
PACKAGE=MY_PACKAGE_NAME SRC_ACCESS_TOKEN=MY_TOKEN SRC_ENDPOINT=https://sourcegraph.test:3443 src code-intel upload -file="cmd/tests/snapshots/output/$PACKAGE/dump.lsif" -root="cmd/tests/snapshots/input/$PACKAGE"
```
