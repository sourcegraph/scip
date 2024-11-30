package main

import (
	"io"
	"os"
	"strings"

	"github.com/bytedance/sonic"
	"github.com/cockroachdb/errors"
	"github.com/k0kubun/pp/v3"
	"github.com/urfave/cli/v2"
)

func printCommand() cli.Command {
	var json, colorOutput bool
	snapshot := cli.Command{
		Name:  "print",
		Usage: "Print a SCIP index for debugging",
		Description: `WARNING: The TTY output may change over time.
Do not rely on non-JSON output in scripts`,
		Flags: []cli.Flag{
			&cli.BoolFlag{
				Name:        "json",
				Usage:       "Output in JSON format",
				Destination: &json,
			},
			&cli.BoolFlag{
				Name:        "color",
				Usage:       "Enable color output for TTY (no effect for JSON)",
				Destination: &colorOutput,
				Value:       true,
				DefaultText: "true",
			},
		},
		Action: func(c *cli.Context) error {
			indexPath := c.Args().Get(0)
			if indexPath == "" {
				return errors.New("missing argument for path to SCIP index")
			}
			// Following https://no-color.org/
			if val, found := os.LookupEnv("NO_COLOR"); found && val != "" {
				switch strings.ToLower(val) {
				case "":
					break
				case "0", "false", "off":
					colorOutput = false
				default:
					colorOutput = true
				}
			}
			return printMain(indexPath, colorOutput, json, c.App.Writer)
		},
	}
	return snapshot
}

func printMain(indexPath string, colorOutput bool, json bool, out io.Writer) error {
	index, err := readFromOption(indexPath)
	if err != nil {
		return err
	}
	if json {
		encoder := sonic.ConfigDefault.NewEncoder(out)
		return encoder.Encode(index)
	} else {
		prettyPrinter := pp.New()
		prettyPrinter.SetColoringEnabled(colorOutput)
		prettyPrinter.SetExportedOnly(true)
		prettyPrinter.SetOutput(out)
		_, err = prettyPrinter.Print(index)
		return err
	}
}
