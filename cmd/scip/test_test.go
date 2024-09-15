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
	require.Equal(t, "reference", actual[0].attribute.kind)
	require.Equal(t, "reference", actual[1].attribute.kind)
	require.Equal(t, "reference", actual[2].attribute.kind)
	require.Equal(t, "diagnostic", actual[3].attribute.kind)

	// validate that additionalData is correctly parsed
	require.True(
		t,
		slices.Equal(
			actual[3].attribute.additionalData,
			[]string{"with multiline", "additional data"},
		),
	)
}

// func TestTest(t *testing.T) {

// }

// func TestIsValidTestCaseForAttribute_length(t *testing.T) {
// 	equalLength := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			enforceLength: true,
// 			attribute:     symbolAttribute{start: 3, length: 5},
// 		},
// 		symbolAttribute{start: 3, length: 5},
// 	)
// 	require.True(t, equalLength)

// 	notEqualLength := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			enforceLength: true,
// 			attribute:     symbolAttribute{start: 3, length: 5},
// 		},
// 		symbolAttribute{start: 3, length: 4},
// 	)
// 	require.False(t, notEqualLength)
// }

// func TestIsValidTestCaseForAttribute_start(t *testing.T) {
// 	validStart := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{start: 4},
// 		},
// 		symbolAttribute{start: 3, length: 5},
// 	)
// 	require.True(t, validStart)

// 	invalidStart := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{start: 9},
// 		},
// 		symbolAttribute{start: 3, length: 5},
// 	)
// 	require.False(t, invalidStart)
// }

// func TestIsValidTestCaseForAttribute_kind(t *testing.T) {
// 	equalKind := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{start: 4, kind: "definition"},
// 		},
// 		symbolAttribute{start: 3, length: 5, kind: "definition"},
// 	)
// 	require.True(t, equalKind)

// 	notEqualKind := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{start: 4, kind: "reference"},
// 		},
// 		symbolAttribute{start: 3, length: 5, kind: "definition"},
// 	)
// 	require.False(t, notEqualKind)
// }

// func TestIsValidTestCaseForAttribute_data(t *testing.T) {
// 	equalSymbol := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{
// 				start: 4,
// 				kind:  "definition",
// 				data:  "scip-dart pub somePackage 1.0.0 lib/`foo.dart`/main().",
// 			},
// 		},
// 		symbolAttribute{
// 			start:  3,
// 			length: 5,
// 			kind:   "definition",
// 			data:   "scip-dart pub somePackage 1.0.0 lib/`foo.dart`/main().",
// 		},
// 	)
// 	require.True(t, equalSymbol)

// 	notEqualSymbol := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{
// 				start: 4,
// 				kind:  "definition",
// 				data:  "scip-dart pub somePackage 1.0.0 lib/`foo.dart`/main().",
// 			},
// 		},
// 		symbolAttribute{
// 			start:  3,
// 			length: 5,
// 			kind:   "definition",
// 			data:   "scip-dart pub somePackage 1.0.0 lib/`foo.dart`/bar().",
// 		},
// 	)
// 	require.False(t, notEqualSymbol)
// }

// func TestIsValidTestCaseForAttribute_additionalData(t *testing.T) {
// 	validWhenMissing := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{
// 				start:          4,
// 				kind:           "diagnostic",
// 				data:           "Warning",
// 				additionalData: []string{},
// 			},
// 		},
// 		symbolAttribute{
// 			start:          3,
// 			length:         5,
// 			kind:           "diagnostic",
// 			data:           "Warning",
// 			additionalData: []string{"some data on this line"},
// 		},
// 	)
// 	require.True(t, validWhenMissing)

// 	validWhenEqual := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{
// 				start:          4,
// 				kind:           "diagnostic",
// 				data:           "Warning",
// 				additionalData: []string{"some data on this line"},
// 			},
// 		},
// 		symbolAttribute{
// 			start:          3,
// 			length:         5,
// 			kind:           "diagnostic",
// 			data:           "Warning",
// 			additionalData: []string{"some data on this line"},
// 		},
// 	)
// 	require.True(t, validWhenEqual)

// 	invalidWhenDifferent := isValidTestCaseForAttribute(
// 		symbolAttributeTestCase{
// 			attribute: symbolAttribute{
// 				start:          4,
// 				kind:           "diagnostic",
// 				data:           "Warning",
// 				additionalData: []string{"some data on this line"},
// 			},
// 		},
// 		symbolAttribute{
// 			start:          3,
// 			length:         5,
// 			kind:           "diagnostic",
// 			data:           "Warning",
// 			additionalData: []string{"Different! Data!"},
// 		},
// 	)
// 	require.False(t, invalidWhenDifferent)
// }
