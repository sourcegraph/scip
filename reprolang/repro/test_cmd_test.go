package repro

import (
	"bytes"
	"os"
	"path/filepath"
	"slices"
	"strings"
	"testing"

	"github.com/hexops/autogold/v2"
	"github.com/stretchr/testify/require"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/testutil"
)

func unwrap[T any](v T, err error) func(*testing.T) T {
	return func(t *testing.T) T {
		require.NoError(t, err)
		return v
	}
}

func TestSCIPTests(t *testing.T) {
	cwd := unwrap(os.Getwd())(t)
	testDir := filepath.Join(cwd, "..", "testdata", "test_cmd")
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

	// To update the snapshot values, run 'go test ./reprolang/repro -update'.
	testCases := []TestCase{
		{"roles",
			autogold.Expect("✓ passes.repro (3 assertions)\n"),
			autogold.Expect(`✗ fails-wrong-role.repro
    Failure [Ln: 1, Col: 13]
      Expected: 'reference reprolang repro_manager roles 1.0.0 fails-wrong-role.repro/hello().'
      Actual:   'definition reprolang repro_manager roles 1.0.0 fails-wrong-role.repro/hello().'
✗ fails-wrong-symbol.repro
    Failure [Ln: 1, Col: 13]
      Expected: 'definition reprolang repro_manager roles 1.0.0 fails-wrong-role.repro/hello2().'
      Actual:   'definition reprolang repro_manager roles 1.0.0 fails-wrong-symbol.repro/hello().'
`),
		},
		{"ranges",
			autogold.Expect("✓ passes.repro (3 assertions)\n"),
			autogold.Expect(`✗ fails.repro
    Failure [Ln: 1, Col: 10]
      Expected: 'definition passes.repro/hello().'
        Actual: <no attributes found>
`),
		},
		{"diagnostics",
			autogold.Expect("✓ passes.repro (2 assertions)\n"),
			autogold.Expect(`✗ fails-incorrect-diagnostic.repro
    Failure [Ln: 1, Col: 11]
      Expected: 'diagnostic Warning:'
                'THIS IS NOT CORRECT'
      Actual: * 'definition reprolang repro_manager diagnostics 1.0.0 fails-incorrect-diagnostic.repro/deprecatedMethod.'
              * 'diagnostic Warning'
                'deprecated identifier'
✗ fails-no-diagnostic.repro
    Failure [Ln: 1, Col: 11]
      Expected: 'diagnostic Warning:'
                'deprecated identifier'
      Actual:   'definition reprolang repro_manager diagnostics 1.0.0 fails-no-diagnostic.repro/hello().'
`),
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
			index := unwrap(Index("file:/"+subtestDir, dirEntry.Name(), sources, []*Dependency{}))(t)

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
			err := testutil.RunTests(subtestDir, passFiles, false, index, "#", &passOutput)
			require.NoError(t, err)
			testCase.passOutput.Equal(t, passOutput.String())

			var failOutput bytes.Buffer
			err = testutil.RunTests(subtestDir, failFiles, false, index, "#", &failOutput)
			require.Error(t, err)
			testCase.failOutput.Equal(t, failOutput.String())
		})
	}
}
