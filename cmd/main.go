package main

import (
	"fmt"
	"os"
	"strings"

	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/sourcegraph/lib/errors"
	"github.com/sourcegraph/sourcegraph/lib/codeintel/lsif/protocol/reader"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

func printHelpAndExit() {
	fmt.Println(
		`usage: scip [FILE]

FILE path to a single file that contains a Protobuf-encoded SCIP payload.`,
	)
	os.Exit(0)
}

func main() {
	if len(os.Args) == 1 {
		printHelpAndExit()
	}
	switch os.Args[1] {
	case "help", "-help", "--help":
		printHelpAndExit()
	default:
		file := os.Args[1]
		if strings.HasSuffix(file, ".scip") || strings.HasSuffix(file, ".lsif-typed") {
			data, err := os.ReadFile(file)
			if err != nil {
				panic(err)
			}
			index := scip.Index{}
			err = proto.Unmarshal(data, &index)
			if err != nil {
				panic(errors.Wrapf(err, "failed to parse protobuf file '%s'", file))
			}
			els, err := convertSCIPToLSIF(&index)
			if err != nil {
				panic(errors.Wrapf(err, "failed reader.ConvertSCIPIndexToLSIFIndex"))
			}
			err = reader.WriteNDJSON(reader.ElementsToJsonElements(els), os.Stdout)
			if err != nil {
				panic(err)
			}
		} else {
			panic(fmt.Sprintf("unexpected file format (must have extension .scip): %s\n", file))
		}
	}
}
