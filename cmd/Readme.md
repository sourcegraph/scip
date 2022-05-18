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
  scip --version
  scip -h | --help

Options:
  --from=<path>  Input file for conversion [default: index.scip].
  --to=<path>    Output file for conversion [default: dump.lsif].
  --version      Show version.
  -h --help      Show help text.

A single dash path ('-') for --from (--to) is interpreted as stdin (stdout).

The 'convert' subcommand currently only supports conversion from SCIP to LSIF.
```

<!-- end usage -->

## Contributing

See [Development.md](./Development.md).

Contributors should abide by the [Sourcegraph Code of Conduct](https://handbook.sourcegraph.com/company-info-and-process/communication/code_of_conduct/).
