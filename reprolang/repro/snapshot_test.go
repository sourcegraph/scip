package repro

import (
	"flag"
	"os"
	"path/filepath"
	"testing"

	"github.com/stretchr/testify/require"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
)

var debugSnapshotAbspaths = flag.Bool("debug-snapshot-abspaths", false, "use absolute paths in snapshot outputs, useful for making uploads to test code navigation")

// TestSCIPSnapshots runs all the snapshot tests.
func TestSCIPSnapshots(t *testing.T) {
	cwd, err := os.Getwd()
	require.Nil(t, err)
	testDir := filepath.Join(cwd, "..", "testdata")
	testutil.SnapshotTest(t, testDir, func(inputDirectory, outputDirectory string, sources []*scip.SourceFile) []*scip.SourceFile {
		testName := filepath.Base(inputDirectory)
		var dependencies []*Dependency
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
			dependencies = append(dependencies, &Dependency{
				Package: &scip.Package{
					Manager: "repro_manager",
					Name:    dir.Name(),
					Version: "1.0.0",
				},
				Sources: dependencySources,
			})
		}
		index, err := Index("file:/"+inputDirectory, testName, sources, dependencies)
		require.Nil(t, err)
		symbolFormatter := scip.DescriptorOnlyFormatter
		symbolFormatter.IncludePackageName = func(name string) bool { return name != testName }
		snapshots, err := testutil.FormatSnapshots(index, "#", symbolFormatter, inputDirectory)
		require.Nil(t, err)
		if debugSnapshotAbspaths != nil && *debugSnapshotAbspaths {
			inputDirAbsPath, err := filepath.Abs(inputDirectory)
			require.Nil(t, err)
			index.Metadata.ProjectRoot = inputDirAbsPath
		} else {
			index.Metadata.ProjectRoot = "file:/root"
		}
		return snapshots
	})
}
