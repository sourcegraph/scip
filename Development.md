# Developing SCIP

- [Project structure](#project-structure)
- [Code generation](#code-generation)
- [Debugging](#debugging)
- [Testing and adding new SCIP semantics](#testing-and-adding-new-scip-semantics)
- [Release a new version](#release-a-new-version)

## Project structure

- [bindings/](./bindings/): Contains a mix of generated and hand-written
  bindings for different languages.
  - The TypeScript, Rust and Haskell bindings are auto-generated.
  - The Go bindings include protoc-generated code as well as extra
    functionality, such as for converting a SCIP index into an LSIF index.
    This is used by the CLI below as well as the
    [Sourcegraph CLI](https://github.com/sourcegraph/src-cli).
- [cmd/scip](./cmd/scip): CLI for SCIP.
  - [cmd/scip/tests/](./cmd/scip/tests/): Test data and packages for SCIP.
    - [cmd/scip/tests/reprolang/](./cmd/scip/tests/reprolang/): A verbose, small language
      which consists of declarations, references, imports and other minor bits
      of functionality, which is used to test the SCIP CLI. The language is
      defined using a [tree-sitter grammar](cmd/scip/tests/reprolang/grammar.js).
      This functionality not meant for use outside of this repository.
- [docs/](./docs/): Auto-generated documentation.

## Code generation

1. Regenerating definitions after changing the schema in [scip.proto](./scip.proto).

   `./dev/generate-all-in-docker.sh`

   We provide a script that sets up the correct build environment in Docker
   and runs the necessary regeneration steps.

   Both the proto bindings and reprolang parser are generated.
   The only dependency you need is Docker.

2. Regenerating snapshots after making changes to the CLI.
   ```
   go test ./cmd/scip -update-snapshots
   ```
3. Regenerating parser for Repro after editing its grammar.
   ```
   cd cmd/scip/tests/reprolang
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
go test ./cmd/scip -update-snapshots -debug-snapshot-abspaths
```

The LSIF index can be uploaded to a local Sourcegraph instance using:

```bash
PACKAGE=MY_PACKAGE_NAME SRC_ACCESS_TOKEN=MY_TOKEN SRC_ENDPOINT=https://sourcegraph.test:3443 src code-intel upload -file="cmd/scip/tests/snapshots/output/$PACKAGE/dump.lsif" -root="cmd/scip/tests/snapshots/input/$PACKAGE"
```

## Release a new version

First, add release notes to the [CHANGELOG](CHANGELOG.md). Next, update the
version in `cmd/scip/version.txt`, `bindings/rust/Cargo.toml` and `docs/CLI.md`

After landing a commit with those two changes, run the release script:
(requires the [GitHub CLI](https://cli.github.com/))

```bash
NEW_VERSION="M.N.P" ./dev/publish-release.sh
```

Once the release is created, the artifacts will be built and uploaded
automatically by the [release action](/.github/workflows/release.yml).
