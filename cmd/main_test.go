package main

import (
	"bytes"
	"os"
	"path/filepath"
	"testing"

	docopt "github.com/docopt/docopt-go"
	"github.com/stretchr/testify/require"

	"github.com/sourcegraph/sourcegraph/lib/codeintel/lsif/protocol/reader"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
	"github.com/sourcegraph/scip/cmd/tests/reprolang/bindings/go/repro"
)

func TestArgumentParsing(t *testing.T) {
	type argMap = map[string]any
	testCases := []struct {
		argv []string
		keys argMap
	}{
		{[]string{"-h"}, argMap{"--help": true}},
		{[]string{"--help"}, argMap{"--help": true}},
		{[]string{"convert"}, argMap{"--from": "index.scip", "--to": "dump.lsif"}},
		{[]string{"convert", "--from", "tmp.scip"}, argMap{"--from": "tmp.scip"}},
		{[]string{"convert", "--from=tmp.scip"}, argMap{"--from": "tmp.scip"}},
		{[]string{"convert", "--to=tmp.lsif"}, argMap{"--to": "tmp.lsif"}},
		{[]string{"convert", "--from=tmp.scip", "--to=tmp.lsif"}, argMap{"--from": "tmp.scip", "--to": "tmp.lsif"}},
		{[]string{"convert", "--to=tmp.lsif", "--from=tmp.scip"}, argMap{"--from": "tmp.scip", "--to": "tmp.lsif"}},
	}
	parser := docopt.Parser{SkipHelpFlags: true}
	for _, testCase := range testCases {
		parsedArgs, err := parser.ParseArgs(helpText(), testCase.argv, "")
		if testCase.keys == nil {
			require.Error(t, err)
			continue
		}
		for k, v := range testCase.keys {
			require.Equal(t, v, parsedArgs[k])
		}
	}
}

// TestSCIPSnapshots runs all the snapshot tests.
func TestSCIPSnapshots(t *testing.T) {
	cwd, err := os.Getwd()
	require.Nil(t, err)
	testDir := filepath.Join(cwd, "tests")
	testutil.SnapshotTest(t, testDir, func(inputDirectory, outputDirectory string, sources []*scip.SourceFile) []*scip.SourceFile {
		testName := filepath.Base(inputDirectory)
		var dependencies []*repro.Dependency
		rootDirectory := filepath.Dir(inputDirectory)
		dirs, err := os.ReadDir(rootDirectory)
		require.Nil(t, err)
		for _, dir := range dirs {
			if !dir.IsDir() {
				continue
			}
			if dir.Name() == testName {
				continue
			}
			dependencyRoot := filepath.Join(rootDirectory, dir.Name())
			dependencySources, err := scip.NewSourcesFromDirectory(dependencyRoot)
			require.Nil(t, err)
			dependencies = append(dependencies, &repro.Dependency{
				Package: &scip.Package{
					Manager: "repro_manager",
					Name:    dir.Name(),
					Version: "1.0.0",
				},
				Sources: dependencySources,
			})
		}
		index, err := repro.Index("file:/"+inputDirectory, testName, sources, dependencies)
		require.Nil(t, err)
		symbolFormatter := scip.DescriptorOnlyFormatter
		symbolFormatter.IncludePackageName = func(name string) bool { return name != testName }
		snapshots, err := testutil.FormatSnapshots(index, "#", symbolFormatter)
		require.Nil(t, err)
		index.Metadata.ProjectRoot = "file:/root"
		lsif, err := scip.ConvertSCIPToLSIF(index)
		require.Nil(t, err)
		var obtained bytes.Buffer
		err = reader.WriteNDJSON(reader.ElementsToJsonElements(lsif), &obtained)
		require.Nil(t, err)
		snapshots = append(snapshots, scip.NewSourceFile(
			filepath.Join(outputDirectory, "dump.lsif"),
			"dump.lsif",
			obtained.String(),
		))
		return snapshots
	})
}
