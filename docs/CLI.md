# SCIP CLI Reference

<!--toc:start-->

- [SCIP CLI Reference](#scip-cli-reference)
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
   lint      Flag potential issues with a SCIP index
   print     Print a SCIP index for debugging
   snapshot  Generate snapshot files for golden testing
   stats     Output useful statistics about a SCIP index
   help, h   Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h     show help
   --version, -v  print the version
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

## `scip test`

```
NAME:
   scip test - Validate subsets of snapshot files

USAGE:
   scip test [command options] [arguments...]

DESCRIPTION:
   The test subcommand validates whether a provided scip index
   file matches manually specified symbol fields within an index. This can be used in
   conjunction with snapshot to provide a cohesive testing framework for scip indexers.

OPTIONS:
   --from value            Path to SCIP index file (default: "index.scip")
   --comment-syntax value  Comment syntax to use for snapshot files (default: "//")
   --help, -h              show help
```

### File Specification

The validation files for `scip test` are loosely based on [Sublime Text's](https://www.sublimetext.com/docs/syntax.html#testing) syntax highlighting files. Symbol ranges are selected using `^`, `^^` and `// <-`. Symbol attributes can be specified as the first word: `definition`, `reference`, `diagnostic`, and all subsequent lines are interpreted based on the kind of symbol attribute you are writing a test for.

Given the following example, the cli command `scip test` will exit with a non-zero exit code if the provided `index.scip` file does not contain a definition, at the specified range, with the specified symbol
```js
function someFunction() {
   //    ^^^^^^^^^^^^ definition scip-typescript npm test_package 1.0.0 lib/`test.js`/someFunction().
}
```

Three range selection comment formats are supported:
- `// ^^^`: enforces the length of the occurrence. Will fail if the range at this location does not equal 3 characters
- `// ^`: ignore length, `^` can occur at any point to any character in the occurrence
- `// <-`: ignore length, and treat the character above the first comment character as the start of the occurrence, similar to Sublime Text

Four selection kinds are currently supported
- `definition`
- `reference`
- `forward_definition`
- `diagnostic`

The `.` character can be used as a wildcard, to match any symbol segment
```js
function someFunction() {
   //        ^ definition . . test_package . lib/`test.js`/someFunction().
}
```

For kinds which can provide additional data, you can use a `>` character on a new line
```js
function someFn() {
   let someVar = "";
   //   ^ diagnostic Warning
   //   > someVar is unused.
   //   > remove it or use it.
}
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
