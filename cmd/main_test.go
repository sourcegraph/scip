package main

import (
	"bytes"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/stretchr/testify/require"

	"github.com/sourcegraph/sourcegraph/lib/codeintel/lsif/protocol/reader"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
	"github.com/sourcegraph/scip/cmd/tests/reprolang/bindings/go/repro"
)

func TestReadmeInSync(t *testing.T) {
	app := scipApp()
	readmeBytes, err := os.ReadFile(filepath.Join("..", "Readme.md"))
	require.Nil(t, err)
	readme := string(readmeBytes)

	check := func(args []string, commandName string) {
		r, w, err := os.Pipe()
		require.Nil(t, err)
		origStdout := os.Stdout
		os.Stdout = w
		defer func() { os.Stdout = origStdout }()

		require.Nil(t, app.Run(args))
		_, err = w.Write([]byte{0}) // needed for Read below to terminate
		require.Nil(t, err)
		helpBytes := make([]byte, 1024*1024)
		n, err := r.Read(helpBytes)
		helpBytes = helpBytes[:n-1] // ignore NULL at end
		require.Nil(t, err)
		help := strings.TrimSpace(string(helpBytes))
		require.Truef(t, strings.Contains(readme, help),
			"Readme.md missing help text %s for %s.\nRun `%s` and paste the output in the Readme.",
			help, commandName, strings.Join(append([]string{"scip"}, args...), " "))
	}

	check([]string{"--help"}, "scip")

	for _, command := range commands() {
		check([]string{command.Name, "--help"}, fmt.Sprintf("subcommand %s", command.Name))
	}
}

var debugSnapshotAbspaths = flag.Bool("debug-snapshot-abspaths", false, "use absolute paths in snapshot outputs, useful for making uploads to test code navigation")

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
		if debugSnapshotAbspaths != nil && *debugSnapshotAbspaths {
			inputDirAbsPath, err := filepath.Abs(inputDirectory)
			require.Nil(t, err)
			index.Metadata.ProjectRoot = inputDirAbsPath
		} else {
			index.Metadata.ProjectRoot = "file:/root"
		}
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
