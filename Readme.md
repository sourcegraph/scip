# SCIP Code Intelligence Protocol

SCIP (pronounciation: "skip") is a language-agnostic protocol
for indexing source code,
which can be used to power code navigation functionality
such as Go to definition, Find references, and Find implementations.

This repository includes:

- A [protobuf schema for SCIP](./scip.proto).
- Rich Go bindings for SCIP: This includes many utility functions
  to help build tooling on top of SCIP.
- Auto-generated bindings for TypeScript, Rust and Haskell.
- The [`scip` CLI](#scip-cli-reference) makes SCIP indexes
  a breeze to work with.

If you're interested in better understanding the motivation behind SCIP,
check out the [announcement blog post](https://about.sourcegraph.com/blog/announcing-scip).

If you're interested in writing a new indexer that emits SCIP,
check out our documentation on
[how to write an indexer](https://docs.sourcegraph.com/code_intelligence/explanations/writing_an_indexer).

## Contributing

We welcome questions, suggestions as well as code and docs contributions.

For submitting contributions, check out [Development.md](./Development.md)
to better understand project structure and common workflows.

Contributors should abide by the [Sourcegraph Code of Conduct](https://handbook.sourcegraph.com/company-info-and-process/communication/code_of_conduct/).

## SCIP CLI reference

```
NAME:
   scip - SCIP Code Intelligence Protocol CLI

USAGE:
   scip [global options] command [command options] [arguments...]

DESCRIPTION:
   For more details, see the project README at:

     https://github.com/sourcegraph/scip

COMMANDS:
   convert   Convert a SCIP index to an LSIF index
   snapshot  Generate snapshot files for golden testing
   stats     Output useful statistics about a SCIP index
   help, h   Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h     show help (default: false)
   --version, -v  Print the current version and exit. (default: false)
```

```
NAME:
   scip convert - Convert a SCIP index to an LSIF index

USAGE:
   scip convert [command options] [arguments...]

OPTIONS:
   --from value  Path to SCIP index file (default: index.scip)
   --to value    Output path for LSIF index (default: dump.lsif)
```

```
NAME:
   scip snapshot - Generate snapshot files for golden testing

USAGE:
   scip snapshot [command options] [arguments...]

DESCRIPTION:
   The snapshot subcommand generates snapshot files which
   can be use for inspecting the output of an index in a
   visual way. Occurrences are marked with caret signs (^)
   and symbol information.

OPTIONS:
   --from value  Path to SCIP index file (default: index.scip)
   --to value    Path to output directory for snapshot files (default: scip-snapshot)
```

```
NAME:
   scip stats - Output useful statistics about a SCIP index

USAGE:
   scip stats [command options] [arguments...]

OPTIONS:
   --from value  Path to SCIP index file (default: index.scip)
```
