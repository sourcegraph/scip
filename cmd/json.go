package main

import (
	"fmt"

	"github.com/sourcegraph/sourcegraph/lib/errors"
	"github.com/urfave/cli/v2"
	"google.golang.org/protobuf/encoding/protojson"
)

type jsonFlags struct {
	from   string
	pretty bool
}

func jsonCommand() cli.Command {
	var jsonFlags jsonFlags

	json := cli.Command{
		Name:  "json",
		Usage: "Print SCIP index as JSON",
		Flags: []cli.Flag{
			fromFlag(&jsonFlags.from),
			&cli.BoolFlag{
				Name:        "pretty",
				Usage:       "Pretty print (multiline, with indentation)",
				Aliases:     []string{"p"},
				Destination: &jsonFlags.pretty,
			},
		},
		Action: func(c *cli.Context) error {
			if jsonFlags.from == "" {
				return errors.New("missing argument for path to SCIP index")
			}
			return jsonMain(jsonFlags)
		},
	}

	return json
}

func jsonMain(flags jsonFlags) error {

	fmt.Println(flags)

	scipIndex, err := readFromOption(flags.from)
	if err != nil {
		return err
	}

	options := protojson.MarshalOptions{
		Multiline: flags.pretty,
	}

	jsonBytes, _ := options.Marshal(scipIndex)
	fmt.Println(string(jsonBytes))

	return nil
}
