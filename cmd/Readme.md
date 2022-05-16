# Semantic Code Intelligence Protocol (SCIP)

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
  scip snapshot [--index-file=<path>]
                --output-directory=<path>
                --comment-syntax=<template>
  scip --version
  scip -h | --help

Options:
  --from=<path>                 Input file for conversion [default: index.scip].
  --to=<path>                   Output file for conversion [default: dump.lsif].
  --index-file=<path>           Path to SCIP index used to generate the snapshot
                                [default: index.scip].
  --output-directory=<path>     Directory to save snapshot results to.
  --comment-syntax=<template>   Template string describing the comment syntax
                                of the language, with a '<content>' substring
                                which will be replaced with snapshot output.
  --version                     Show version.
  -h --help                     Show help text.

A single dash ('-') value for <path> is interpreted as standard input for
input flags and as standard output for output flags.

Examples:

  # convert Protobuf-encoded SCIP index to JSON-based LSIF index
  scip convert

  # generate snapshots for testing a Python indexer
  scip snapshot \
    --index-file=snapshots/input/mytest/index.scip \
    --output-directory=snapshots/output/mytest \
    --comment-syntax='# <content>'

  # generate snapshots for testing an OCaml indexer
  scip snapshot --output-directory=output \
                --comment-syntax='(* <content> *)'

Limitations:

- The 'convert' subcommand currently only supports conversion from SCIP to LSIF.
```

<!-- end usage -->

## Contributing

See [Development.md](./Development.md).

Contributors should abide by the [Sourcegraph Code of Conduct](https://handbook.sourcegraph.com/company-info-and-process/communication/code_of_conduct/).
