# ChangeLog

## v0.3.0

scip schema:

- Several new fields were added:
  [`SymbolInformation.signature_documentation`](https://github.com/sourcegraph/scip/pull/159),
  [`SymbolInformation.display_name`](https://github.com/sourcegraph/scip/pull/158),
  [`SymbolInformation.kind`](https://github.com/sourcegraph/scip/pull/156)
  [`Occurrence.enclosing_range`](https://github.com/sourcegraph/scip/pull/150)

scip CLI:

- The `print` subcommand supports a new `--json` flag to emit JSON output
  instead of colored textual output. (https://github.com/sourcegraph/scip/pull/147)
- The `snapshot` subcommand supports a new `--comment-syntax` flag
  to customize the prefix used for inline comments in snapshot output.
  (https://github.com/sourcegraph/scip/pull/139)
- `snapshot` output now include override_documentation for occurrences.
  (https://github.com/sourcegraph/scip/pull/116)

Go bindings:

- Adds API for parsing indexes in a streaming fashion.
  (https://github.com/sourcegraph/scip/pull/172)
- Fixed a panic when descriptors are incomplete
  (https://github.com/sourcegraph/scip/pull/171)

Rust bindings:

- Fixes a bug when emitting symbols which require escaping
  (https://github.com/sourcegraph/scip/pull/169)
- Fixes a bug in handling for macro symbols
  (https://github.com/sourcegraph/scip/pull/145)

## v0.2.3

### Fixes

- Fixed a bug in SCIP to LSIF conversion of indexes using the new `Relationship.is_definition` field. Without this fix, the generated LSIF index would fail to process in Sourcegraph with a "unknown reference to $ID (expected a range)" error. (https://github.com/sourcegraph/scip/pull/108)

## v0.2.2

### Additions

- The new `scip print` subcommand can be used to view a SCIP index without access to protoc. (https://github.com/sourcegraph/scip/pull/91)
- The new `scip lint` subcommand can be used to identify correctness and redundancy issues with a SCIP index. (https://github.com/sourcegraph/scip/pull/92)

### Fixes

- `scip --version` now works as expected instead of reporting 0.1.0. (https://github.com/sourcegraph/scip/pull/97)
