package main

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
)

func snapshotMain(parsedArgs map[string]interface{}) error {
	from := parsedArgs["--from"].(string)
	index, err := readFromOption(from)
	if err != nil {
		return err
	}
	output := parsedArgs["--output"].(string)
	err = os.RemoveAll(output)
	if err != nil {
		return err
	}
	snapshots, err := testutil.FormatSnapshots(index, "//", scip.VerboseSymbolFormatter)
	if err != nil {
		return err
	}
	for _, snapshot := range snapshots {
		outputPath := filepath.Join(output, snapshot.RelativePath)
		err = os.MkdirAll(filepath.Dir(outputPath), 0755)
		if err != nil {
			return err
		}
		err = os.WriteFile(outputPath, []byte(snapshot.Text), 0755)
		if err != nil {
			return err
		}
	}
	fmt.Println("done: " + output)
	return nil
}
