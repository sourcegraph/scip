package scip

import (
	"fmt"
	"testing"

	"github.com/hexops/autogold/v2"
)

const testFileContents = `Mary had a little lamb,
Its fleece was white as snow.
And everywhere that Mary went,
The lamb was sure to go.
`

func TestRangeText(t *testing.T) {
	// Update expect values with `go test ./bindings/go/scip -update`
	testCases := []struct {
		range_ []int32
		expect autogold.Value
	}{
		{range_: []int32{0, 0, 0, 0}, expect: autogold.Expect("")},
		{range_: []int32{0, 0, 0, 8}, expect: autogold.Expect("Mary had")},
		{range_: []int32{0, 0, 1, 0}, expect: autogold.Expect("Mary had a little lamb,\n")},
		{range_: []int32{0, 0, 1, 10}, expect: autogold.Expect("Mary had a little lamb,\nIts fleece")},
		{range_: []int32{0, 0, 4, 0}, expect: autogold.Expect(`Mary had a little lamb,
Its fleece was white as snow.
And everywhere that Mary went,
The lamb was sure to go.
`)},
	}

	sourceFile := NewSourceFile("", "", testFileContents)

	for _, testCase := range testCases {
		r := testCase.range_
		range_ := Range{Start: Position{Line: r[0], Character: r[1]}, End: Position{Line: r[2], Character: r[3]}}
		t.Run(fmt.Sprintf("%v", range_), func(t *testing.T) {
			testCase.expect.Equal(t, sourceFile.RangeText(range_))
		})
	}
}
