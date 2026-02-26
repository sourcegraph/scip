package scip

import (
	"fmt"
	"testing"

	"github.com/stretchr/testify/require"
)

const testFileContents = `Mary had a little lamb,
Its fleece was white as snow.
And everywhere that Mary went,
The lamb was sure to go.
`

func TestRangeText(t *testing.T) {
	testCases := []struct {
		range_ []int32
		expect string
	}{
		{range_: []int32{0, 0, 0, 0}, expect: ""},
		{range_: []int32{0, 0, 0, 8}, expect: "Mary had"},
		{range_: []int32{0, 0, 1, 0}, expect: "Mary had a little lamb,\n"},
		{range_: []int32{0, 0, 1, 10}, expect: "Mary had a little lamb,\nIts fleece"},
		{range_: []int32{0, 0, 4, 0}, expect: `Mary had a little lamb,
Its fleece was white as snow.
And everywhere that Mary went,
The lamb was sure to go.
`},
	}

	sourceFile := NewSourceFile("", "", testFileContents)

	for _, testCase := range testCases {
		r := testCase.range_
		range_ := Range{Start: Position{Line: r[0], Character: r[1]}, End: Position{Line: r[2], Character: r[3]}}
		t.Run(fmt.Sprintf("%v", range_), func(t *testing.T) {
			require.Equal(t, testCase.expect, sourceFile.RangeText(range_))
		})
	}
}
