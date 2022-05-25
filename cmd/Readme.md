# SCIP Code Intelligence Protocol

SCIP (pronounciation: "skip") is a language-agnostic protocol
for indexing source code,
which can be used to power code navigation functionality
such as Go to Definition, Find References, and Find Implementations.

This repository includes:

- A [protobuf schema for SCIP](./scip.proto).
- Rich Go bindings for SCIP: This includes many utility functions
  to help build tooling on top of SCIP.
- Auto-generated bindings for TypeScript, Rust and Haskell.
- The [`scip` CLI](#scip-cli-reference) makes SCIP indexes
  a breeze to work with.

<!-- TODO: Link to announcement blog post for "Why SCIP?"
     or copy content from it here once the post is ready. -->

<!--
Workaround: This file is under cmd/ and symlinked from the root
instead of being present at the root because:
1. go:embed doesn't allow .. in embed paths.
2. GitHub Flavored Markdown doesn't allow file inclusion.
3. It is useful to keep the help text automatically in sync
   between the Readme and the CLI output.
-->

## SCIP CLI reference

<!-- begin usage -->

```
Usage:
  scip convert [--from=<path>] [--to=<path>]
  scip stats [--from=<path>]
  scip snapshot [--from=<path>] [--output=<path>]
  scip --version
  scip -h | --help

Options:
  --from=<path>   Input file for conversion [default: index.scip].
  --to=<path>     Output file for conversion [default: dump.lsif].
  --output=<path> Output directory [default: scip-snapshot].
  --version       Show version.
  -h --help       Show help text.

A single dash path ('-') for --from (--to) is interpreted as stdin (stdout).

The 'convert' subcommand currently only supports conversion from SCIP to LSIF.
```

<!-- end usage -->

## Contributing

We welcome questions, suggestions as well as code and docs contributions.

For submitting contributions, check out [Development.md](./Development.md)
to better understand project structure and common workflows.

Contributors should abide by the [Sourcegraph Code of Conduct](https://handbook.sourcegraph.com/company-info-and-process/communication/code_of_conduct/).
