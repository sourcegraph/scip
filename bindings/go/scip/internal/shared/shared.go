// Package shared has functions used both by the old parser and the new parser.
package shared

func IsSimpleIdentifierCharacter(c rune) bool {
	return c == '_' || c == '+' || c == '-' || c == '$' || ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9')
}

// IsSimpleIdentifier matches the definition of <simple-identifier> in scip.proto.
func IsSimpleIdentifier(s string) bool {
	for _, c := range s {
		if IsSimpleIdentifierCharacter(c) {
			continue
		}
		return false
	}
	return true
}
