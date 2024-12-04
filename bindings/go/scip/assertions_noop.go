//go:build !asserts

package scip

// assert is a noop in release builds - the implementation is in assertions.go
func assert(cond bool, msg string) {}
