package main

import (
	"bytes"
	"os"
	"path/filepath"
	"testing"

	"github.com/stretchr/testify/require"

	"github.com/sourcegraph/sourcegraph/lib/codeintel/lsif/protocol/reader"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
	"github.com/sourcegraph/scip/reprolang/bindings/go/repro"
)

// TestSCIPSnapshots runs all the snapshot tests.
func TestSCIPSnapshots(t *testing.T) {
	testutil.SnapshotTest(t, func(inputDirectory, outputDirectory string, sources []*scip.SourceFile) []*scip.SourceFile {
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
		lsif, err := convertSCIPToLSIF(index)
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
