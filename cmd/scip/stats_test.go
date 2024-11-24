package main

import (
	"testing"

	"github.com/stretchr/testify/require"
)

func TestRound(t *testing.T) {
	require.Equal(t, 3.000, roundToSigfigs(3.0001, 3))
	require.Equal(t, -3.000, roundToSigfigs(-3.0001, 3))
	require.Equal(t, 0.000107, roundToSigfigs(0.0001068, 3))
	require.Equal(t, 1070000.0, roundToSigfigs(1068000, 3))
}
