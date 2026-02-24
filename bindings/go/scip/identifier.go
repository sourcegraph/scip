package scip

func isSimpleIdentifierCharacter(c rune) bool {
	return c == '_' || c == '+' || c == '-' || c == '$' || ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9')
}

// isSimpleIdentifier matches the definition of <simple-identifier> in scip.proto.
func isSimpleIdentifier(s string) bool {
	for _, c := range s {
		if isSimpleIdentifierCharacter(c) {
			continue
		}
		return false
	}
	return true
}
