package main

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestCommentsForLine(t *testing.T) {
	res := commentsForLine(3, []string{}, "//")
	require.Equal(t, []string{}, res)

	res = commentsForLine(3, []string{
		"some",
		"line",
		" // comm",
		"here",
		"   // this",
		" // comment",
		"nothing",
	}, "//")
	require.Equal(t, []string{
		"   // this",
		" // comment",
	}, res)

	res = commentsForLine(1, []string{
		"nothing",
		"something",
		"  # comment on last line",
	}, "#")
	require.Equal(t, []string{"  # comment on last line"}, res)
}

func TestParseTestCase(t *testing.T) {
	res := parseTestCase("    // ^^^^ definition some scip symbol here", "//")
	require.Equal(t, true, res.enforceLength)
	require.Equal(t, 4, res.attribute.length)
	require.Equal(t, 7, res.attribute.start)
	require.Equal(t, "definition", res.attribute.kind)
	require.Equal(t, "some scip symbol here", res.attribute.data)

	res = parseTestCase("#  ^ reference some other scip symbol here", "#")
	require.Equal(t, false, res.enforceLength)
	require.Equal(t, 3, res.attribute.start)
	require.Equal(t, "reference", res.attribute.kind)
	require.Equal(t, "some other scip symbol here", res.attribute.data)

	res = parseTestCase("    // <- forward_definition some scip symbol here", "//")
	require.Equal(t, false, res.enforceLength)
	require.Equal(t, 4, res.attribute.start)
	require.Equal(t, "forward_definition", res.attribute.kind)
	require.Equal(t, "some scip symbol here", res.attribute.data)
}

func TestIsValidTestCase(t *testing.T) {
	require.True(t, isValidTestCase(
		parseTestCase("  // ^^^ definition symbol", "//"),
		[]*symbolAttribute{
			parseTestCase("// ^^^ reference foobar", "//").attribute,
			parseTestCase("  // ^^^ definition symbol", "//").attribute,
			parseTestCase("     // ^^ definition symbol", "//").attribute,
		},
	))

	require.False(t, isValidTestCase(
		parseTestCase("  // ^^^ reference symbol", "//"),
		[]*symbolAttribute{
			parseTestCase("// ^^^ reference foobar", "//").attribute,
			parseTestCase("  // ^^^ definition symbol", "//").attribute,
			parseTestCase("     // ^^ definition symbol", "//").attribute,
		},
	))
}
