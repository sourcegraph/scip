//go:build asserts

package scip

func assert(cond bool, msg string) {
	if !cond {
		panic(msg)
	}
}
