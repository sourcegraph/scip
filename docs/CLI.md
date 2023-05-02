# SCIP CLI Reference

```
NAME:
   scip - SCIP Code Intelligence Protocol CLI

USAGE:
   scip [global options] command [command options] [arguments...]

VERSION:
   v0.2.3

DESCRIPTION:
   For more details, see the project README at:

     https://github.com/sourcegraph/scip

COMMANDS:
   convert   Convert a SCIP index to an LSIF index
   lint      Flag potential issues with a SCIP index
   print     Print a SCIP index in a human-readable format for debugging
   snapshot  Generate snapshot files for golden testing
   stats     Output useful statistics about a SCIP index
   help, h   Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h     show help (default: false)
   --version, -v  print the version (default: false)`
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

OPTIONS:
   --help, -h  show help (default: false)
```

## `scip print`

```
NAME:
   scip print - Print a SCIP index in a human-readable format for debugging

USAGE:
   scip print [command options] [arguments...]

DESCRIPTION:
   WARNING: The output may change over time.
   Do not rely on the output of this command in scripts

OPTIONS:
   --help, -h  show help (default: false)
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
   --from value  Path to SCIP index file (default: index.scip)
   --to value    Path to output directory for snapshot files (default: scip-snapshot)
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
