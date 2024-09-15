package main

import (
	"slices"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestTestCasesForLine(t *testing.T) {
	actual, linesUsed := testCasesForLine(
		2,
		[]string{
			"void main() {",
			" //   ^ definition <skipped line>",
			"  print(foo)",
			"  //    ^^^ reference <with enforce length>",
			"  //     ^ reference <single line>",
			"        // <- reference <start of comment>",
			"  //    ^ diagnostic Warning",
			"  //    > with multiline",
			"  //    > additional data",
			"  final test = 4",
			"         ^ definition <skipped line>",
			"}",
		},
		"//",
	)

	// total of 4 test cases on the specified line
	require.Equal(t, 4, len(actual))
	require.Equal(t, 6, linesUsed)

	// only the first test case has enforceLength = true
	require.True(t, actual[0].enforceLength)
	require.Equal(t, 3, actual[0].attribute.length)

	// all test cases should have the same start
	require.Equal(t, 8, actual[0].attribute.start)
	require.Equal(t, 9, actual[1].attribute.start) // different start, same symbol
	require.Equal(t, 8, actual[2].attribute.start)
	require.Equal(t, 8, actual[3].attribute.start)

	// validate kind on each test case
	require.Equal(t, referenceAttrKind, actual[0].attribute.kind)
	require.Equal(t, referenceAttrKind, actual[1].attribute.kind)
	require.Equal(t, referenceAttrKind, actual[2].attribute.kind)
	require.Equal(t, diagnosticAttrKind, actual[3].attribute.kind)

	// validate that additionalData is correctly parsed
	require.True(
		t,
		slices.Equal(
			actual[3].attribute.additionalData,
			[]string{"with multiline", "additional data"},
		),
	)
}
