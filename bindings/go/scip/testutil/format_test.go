package testutil

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestIsScipRangeLess(t *testing.T) {
	testCases := []struct {
		lhs []int32
		rhs []int32
	}{
		{[]int32{0, 1, 2}, []int32{1, 0, 0}},
		{[]int32{0, 1, 10}, []int32{0, 2, 3}},
		{[]int32{0, 1, 2, 3}, []int32{0, 2, 4}},
		{[]int32{0, 1, 4}, []int32{0, 1, 2, 3}},
		{[]int32{0, 1, 2, 3}, []int32{0, 1, 4, 0}},
		{[]int32{0, 1, 2, 3}, []int32{0, 1, 2, 4}},
	}
	for _, testCase := range testCases {
		require.Truef(t, isSCIPRangeLess(testCase.lhs, testCase.rhs),
			"%v ≮ %v", testCase.lhs, testCase.rhs)
		require.Falsef(t, isSCIPRangeLess(testCase.rhs, testCase.lhs),
			"%v < %v", testCase.rhs, testCase.lhs)

		require.Falsef(t, isSCIPRangeLess(testCase.lhs, testCase.lhs),
			"%v < %v", testCase.lhs, testCase.lhs)
		require.Falsef(t, isSCIPRangeLess(testCase.lhs, testCase.lhs),
			"%v < %v", testCase.rhs, testCase.rhs)
	}

}
