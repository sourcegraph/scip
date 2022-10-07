# ChangeLog

## v0.2.3

### Fixes

- Fixed a bug in SCIP to LSIF conversion of indexes using the new `Relationship.is_definition` field. Without this fix, the generated LSIF index would fail to process in Sourcegraph with a "unknown reference to $ID (expected a range)" error. (https://github.com/sourcegraph/scip/pull/108)

## v0.2.2

### Additions

- The new `scip print` subcommand can be used to view a SCIP index without access to protoc. (https://github.com/sourcegraph/scip/pull/91)
- The new `scip lint` subcommand can be used to identify correctness and redundancy issues with a SCIP index. (https://github.com/sourcegraph/scip/pull/92)

### Fixes

- `scip --version` now works as expected instead of reporting 0.1.0. (https://github.com/sourcegraph/scip/pull/97)
