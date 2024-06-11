# SCIP CLI Reference

<!--toc:start-->

- [SCIP CLI Reference](#scip-cli-reference)
  - [`scip convert`](#scip-convert)
  - [`scip lint`](#scip-lint)
  - [`scip print`](#scip-print)
  - [`scip snapshot`](#scip-snapshot)
  - [`scip stats`](#scip-stats)
  <!--toc:end-->

```
NAME:
   scip - SCIP Code Intelligence Protocol CLI

USAGE:
   scip [global options] command [command options] [arguments...]

VERSION:
   v0.4.0

DESCRIPTION:
   For more details, see the project README at:

     https://github.com/sourcegraph/scip

COMMANDS:
   convert   Convert a SCIP index to an LSIF index
   lint      Flag potential issues with a SCIP index
   print     Print a SCIP index for debugging
   snapshot  Generate snapshot files for golden testing
   stats     Output useful statistics about a SCIP index
   help, h   Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h     show help
   --version, -v  print the version
```

## `scip convert`

```
NAME:
   scip convert - Convert a SCIP index to an LSIF index

USAGE:
   scip convert [command options] [arguments...]

OPTIONS:
   --from value  Path to SCIP index file (default: index.scip)
   --to value    Output path for LSIF index (default: dump.lsif)
```

## `scip lint`

```
NAME:
   scip lint - Flag potential issues with a SCIP index

USAGE:
   scip lint [command options] [arguments...]

DESCRIPTION:
   Example usage:

     scip lint /path/to/index.scip

   You may want to filter the output using `grep -v <pattern>`
   to narrow down on certain classes of errors.
```

## `scip print`

```
NAME:
   scip print - Print a SCIP index for debugging

USAGE:
   scip print [command options] [arguments...]

DESCRIPTION:
   WARNING: The TTY output may change over time.
   Do not rely on non-JSON output in scripts

OPTIONS:
   --json      Output in JSON format (default: false)
   --color     Enable color output for TTY (no effect for JSON) (default: true)
   --help, -h  show help
```

## `scip snapshot`

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
   --from value            Path to SCIP index file (default: "index.scip")
   --to value              Path to output directory for snapshot files (default: "scip-snapshot")
   --project-root value    Override project root in the SCIP file. For example, this can be helpful when the SCIP index was created inside a Docker image or created on another computer
   --strict                If true, fail fast on errors (default: true)
   --comment-syntax value  Comment syntax to use for snapshot files (default: "//")
```

## `scip stats`

```
NAME:
   scip stats - Output useful statistics about a SCIP index

USAGE:
   scip stats [command options] [arguments...]

OPTIONS:
   --from value  Path to SCIP index file (default: index.scip)
```
