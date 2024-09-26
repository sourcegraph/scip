package main

import (
	"bytes"
	"flag"
	"fmt"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/hexops/autogold/v2"
	"github.com/stretchr/testify/require"
	"golang.org/x/exp/slices"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
	"github.com/sourcegraph/scip/cmd/scip/tests/reprolang/bindings/go/repro"
)

func TestMain(m *testing.M) {
	Reproducible = "true"
	os.Exit(m.Run())
}

func TestCLIReferenceInSync(t *testing.T) {
	app := scipApp()
	readmeBytes, err := os.ReadFile(filepath.Join("..", "..", "docs", "CLI.md"))
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
			"docs/CLI.md missing help text %s for %s.\nRun `%s` and paste the output in the Readme.",
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

func unwrap[T any](v T, err error) func(*testing.T) T {
	return func(t *testing.T) T {
		require.NoError(t, err)
		return v
	}
}

func TestSCIPTests(t *testing.T) {
	cwd := unwrap(os.Getwd())(t)
	testDir := filepath.Join(cwd, "tests", "test_cmd")
	testPaths := unwrap(os.ReadDir(testDir))(t)
	require.Truef(t, len(testPaths) >= 1, "Expected at least one test case in directory: %v", testDir)

	os.Setenv("NO_COLOR", "1")
	t.Cleanup(func() {
		os.Unsetenv("NO_COLOR")
	})

	type TestCase struct {
		dir        string
		passOutput autogold.Value
		failOutput autogold.Value
	}

	// To update the snapshot values, run 'go test ./cmd/scip -update'.
	testCases := []TestCase{
		{"roles",
			autogold.Expect("✓ passes.repro (3 assertions)\n"),
			autogold.Expect(`✗ fails-wrong-role.repro
    Failure - row: 0, column: 13
      Expected: 'reference reprolang repro_manager roles 1.0.0 fails-wrong-role.repro/hello().'
      Actual:
        - 'definition reprolang repro_manager roles 1.0.0 fails-wrong-role.repro/hello().'✗ fails-wrong-symbol.repro
    Failure - row: 0, column: 13
      Expected: 'definition reprolang repro_manager roles 1.0.0 fails-wrong-role.repro/hello2().'
      Actual:
        - 'definition reprolang repro_manager roles 1.0.0 fails-wrong-symbol.repro/hello().'`),
		},
		{"ranges",
			autogold.Expect("✓ passes.repro (3 assertions)\n"),
			autogold.Expect(`✗ fails.repro
    Failure - row: 0, column: 10
      Expected: 'definition passes.repro/hello().'
      Actual:
        - No attributes found`),
		},
		{"diagnostics",
			autogold.Expect("✓ passes.repro (2 assertions)\n"),
			autogold.Expect(`✗ fails-incorrect-diagnostic.repro
    Failure - row: 0, column: 11
      Expected: 'diagnostic Warning:'
                'THIS IS NOT CORRECT'
      Actual:
        - 'definition reprolang repro_manager diagnostics 1.0.0 fails-incorrect-diagnostic.repro/deprecatedMethod.'
        - 'diagnostic Warning'
          'deprecated identifier'✗ fails-no-diagnostic.repro
    Failure - row: 0, column: 11
      Expected: 'diagnostic Warning:'
                'deprecated identifier'
      Actual:
        - 'definition reprolang repro_manager diagnostics 1.0.0 fails-no-diagnostic.repro/hello().'`),
		},
	}

	for _, testPath := range testPaths {
		require.Truef(t, slices.ContainsFunc(testCases, func(testCase TestCase) bool {
			return testCase.dir == testPath.Name()
		}), "Missing entry in testOutputs for %q", testPath.Name())
	}

	for _, testCase := range testCases {
		var dirEntry os.DirEntry
		require.Truef(t, slices.ContainsFunc(testPaths, func(entry os.DirEntry) bool {
			if entry.Name() == testCase.dir {
				dirEntry = entry
				return true
			}
			return false
		}), "Stale entry in testOutputs for %q; did you rename or remove the directory", testCase.dir)

		subtestDir := filepath.Join(testDir, dirEntry.Name())
		require.Truef(t, dirEntry.IsDir(), "not a directory: %q", subtestDir)

		t.Run(testCase.dir, func(t *testing.T) {
			sources := unwrap(scip.NewSourcesFromDirectory(subtestDir))(t)
			index := unwrap(repro.Index("file:/"+subtestDir, dirEntry.Name(), sources, []*repro.Dependency{}))(t)

			var passFiles, failFiles []string
			testFiles := unwrap(os.ReadDir(subtestDir))(t)
			for _, testFile := range testFiles {
				if strings.HasPrefix(testFile.Name(), "passes") {
					passFiles = append(passFiles, testFile.Name())
				} else if strings.HasPrefix(testFile.Name(), "fails") {
					failFiles = append(failFiles, testFile.Name())
				} else {
					t.Fatalf("Test files must start with 'passes' or 'fails'. Received %v", testFile.Name())
				}
			}

			var passOutput bytes.Buffer
			err := testMain(subtestDir, passFiles, index, "#", &passOutput)
			require.NoError(t, err)
			testCase.passOutput.Equal(t, passOutput.String())

			var failOutput bytes.Buffer
			err = testMain(subtestDir, failFiles, index, "#", &failOutput)
			require.Error(t, err)
			testCase.failOutput.Equal(t, failOutput.String())
		})
	}
}
