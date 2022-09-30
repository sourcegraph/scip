# SCIP Code Intelligence Protocol

SCIP (pronunciation: "skip") is a language-agnostic protocol
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
Also, check out the [Debugging section][] in the Development docs.

If you're interested in consuming SCIP data,
you can either use one of the [provided language bindings](https://github.com/sourcegraph/scip/tree/main/bindings),
or generate code for the [SCIP protobuf schema](./scip.proto)
using the protobuf toolchain for your language ecosystem.
Also, check out the [Debugging section][] in the Development docs.

[debugging section]: ./Development.md#debugging

## Contributing

We welcome questions, suggestions as well as code and docs contributions.

For submitting contributions, check out [Development.md](./Development.md)
to better understand project structure and common workflows.

Contributors should abide by the [Sourcegraph Code of Conduct](https://handbook.sourcegraph.com/company-info-and-process/communication/code_of_conduct/).

## Installing CLI

You can find binaries for `scip`
[here](https://github.com/sourcegraph/scip/releases). If you'd like to create a
binary locally you can do so with:

```sh
git clone https://github.com/sourcegraph/scip.git --depth=1
cd scip
go build -o scip ./cmd
```

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

### `scip convert`

```
NAME:
   scip convert - Convert a SCIP index to an LSIF index

USAGE:
   scip convert [command options] [arguments...]

OPTIONS:
   --from value  Path to SCIP index file (default: index.scip)
   --to value    Output path for LSIF index (default: dump.lsif)
```

### `scip snapshot`

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

### `scip stats`

```
NAME:
   scip stats - Output useful statistics about a SCIP index

USAGE:
   scip stats [command options] [arguments...]

OPTIONS:
   --from value  Path to SCIP index file (default: index.scip)
```

### `scip view`

```
NAME:
   scip view - Print a SCIP index in a human-readable format

USAGE:
   scip view [command options] Path to SCIP index (or - for stdin)

DESCRIPTION:
   Warning: The output may change over time.
   Do not rely on the output of this command in scripts

OPTIONS:
   --help, -h  show help (default: false)

```
