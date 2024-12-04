package internal

import (
	"fmt"
	"strings"

	"github.com/cockroachdb/errors"
	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/bindings/go/scip/internal/shared"
)

func tryParseLocalSymbol(symbol string) (string, error) {
	if !strings.HasPrefix(symbol, "local ") {
		return "", nil
	}
	suffix := symbol[6:]
	if len(suffix) > 0 && shared.IsSimpleIdentifier(suffix) {
		return suffix, nil
	}
	return "", errors.Newf("expected format 'local <simple-identifier>' but got: %v", symbol)
}

// ParsePartialSymbolV1ToBeDeleted parses an SCIP string into the Symbol message
// with the option to exclude the `.Descriptor` field.
//
// Nov 30 2024: This is currently only present for benchmarking + compatibility
// reasons. We can remove this in the future once we're confident that the new
// parser handles everything correctly.
func ParsePartialSymbolV1ToBeDeleted(symbol string, includeDescriptors bool) (*scip.Symbol, error) {
	local, err := tryParseLocalSymbol(symbol)
	if err != nil {
		return nil, err
	}
	if local != "" {
		return &scip.Symbol{
			Scheme: "local",
			Descriptors: []*scip.Descriptor{
				{Name: local, Suffix: scip.Descriptor_Local},
			},
		}, nil
	}
	s := newSymbolParser(symbol)
	scheme, err := s.acceptSpaceEscapedIdentifier("scheme")
	if err != nil {
		return nil, err
	}
	manager, err := s.acceptSpaceEscapedIdentifier("package manager")
	if err != nil {
		return nil, err
	}
	if manager == "." {
		manager = ""
	}
	packageName, err := s.acceptSpaceEscapedIdentifier("package name")
	if err != nil {
		return nil, err
	}
	if packageName == "." {
		packageName = ""
	}
	packageVersion, err := s.acceptSpaceEscapedIdentifier("package version")
	if err != nil {
		return nil, err
	}
	if packageVersion == "." {
		packageVersion = ""
	}
	var descriptors []*scip.Descriptor
	if includeDescriptors {
		descriptors, err = s.parseDescriptors()
	}
	return &scip.Symbol{
		Scheme: scheme,
		Package: &scip.Package{
			Manager: manager,
			Name:    packageName,
			Version: packageVersion,
		},
		Descriptors: descriptors,
	}, err
}

type symbolParser struct {
	Symbol       []rune
	index        int
	SymbolString string
}

func newSymbolParser(symbol string) *symbolParser {
	return &symbolParser{
		SymbolString: symbol,
		Symbol:       []rune(symbol),
		index:        0,
	}
}

func (s *symbolParser) error(message string) error {
	return errors.Newf("%s\n%s\n%s^", message, s.SymbolString, strings.Repeat("_", s.index))
}

func (s *symbolParser) current() rune {
	if s.index < len(s.Symbol) {
		return s.Symbol[s.index]
	}
	return '\x00'
}

func (s *symbolParser) peekNext() rune {
	if s.index+1 < len(s.Symbol) {
		return s.Symbol[s.index]
	}
	return 0
}

func (s *symbolParser) parseDescriptors() ([]*scip.Descriptor, error) {
	var result []*scip.Descriptor
	for s.index < len(s.Symbol) {
		descriptor, err := s.parseDescriptor()
		if err != nil {
			return nil, err
		}
		result = append(result, descriptor)
	}
	return result, nil
}

func (s *symbolParser) parseDescriptor() (*scip.Descriptor, error) {
	start := s.index
	switch s.peekNext() {
	case '(':
		s.index++
		name, err := s.acceptIdentifier("parameter name")
		if err != nil {
			return nil, err
		}
		return &scip.Descriptor{Name: name, Suffix: scip.Descriptor_Parameter}, s.acceptCharacter(')', "closing parameter name")
	case '[':
		s.index++
		name, err := s.acceptIdentifier("type parameter name")
		if err != nil {
			return nil, err
		}
		return &scip.Descriptor{Name: name, Suffix: scip.Descriptor_TypeParameter}, s.acceptCharacter(']', "closing type parameter name")
	default:
		name, err := s.acceptIdentifier("descriptor name")
		if err != nil {
			return nil, err
		}
		suffix := s.current()
		s.index++
		switch suffix {
		case '(':
			disambiguator := ""
			if s.peekNext() != ')' {
				disambiguator, err = s.acceptIdentifier("method disambiguator")
				if err != nil {
					return nil, err
				}
			}
			err = s.acceptCharacter(')', "closing method")
			if err != nil {
				return nil, err
			}
			return &scip.Descriptor{Name: name, Disambiguator: disambiguator, Suffix: scip.Descriptor_Method}, s.acceptCharacter('.', "closing method")
		case '/':
			return &scip.Descriptor{Name: name, Suffix: scip.Descriptor_Namespace}, nil
		case '.':
			return &scip.Descriptor{Name: name, Suffix: scip.Descriptor_Term}, nil
		case '#':
			return &scip.Descriptor{Name: name, Suffix: scip.Descriptor_Type}, nil
		case ':':
			return &scip.Descriptor{Name: name, Suffix: scip.Descriptor_Meta}, nil
		case '!':
			return &scip.Descriptor{Name: name, Suffix: scip.Descriptor_Macro}, nil
		default:
		}
	}

	end := s.index
	if s.index > len(s.Symbol) {
		end = len(s.Symbol)
	}
	return nil, errors.Newf("unrecognized descriptor %q", string(s.Symbol[start:end]))
}

func (s *symbolParser) acceptIdentifier(what string) (string, error) {
	if s.current() == '`' {
		s.index++
		return s.acceptBacktickEscapedIdentifier(what)
	}
	start := s.index
	for s.index < len(s.Symbol) && shared.IsSimpleIdentifierCharacter(s.current()) {
		s.index++
	}
	if start == s.index {
		return "", s.error("empty identifier")
	}
	return string(s.Symbol[start:s.index]), nil
}

func (s *symbolParser) acceptSpaceEscapedIdentifier(what string) (string, error) {
	return s.acceptEscapedIdentifier(what, ' ')
}

func (s *symbolParser) acceptBacktickEscapedIdentifier(what string) (string, error) {
	return s.acceptEscapedIdentifier(what, '`')
}

func (s *symbolParser) acceptEscapedIdentifier(what string, escapeCharacter rune) (string, error) {
	builder := strings.Builder{}
	for s.index < len(s.Symbol) {
		ch := s.current()
		if ch == escapeCharacter {
			s.index++
			if s.index >= len(s.Symbol) {
				break
			}
			if s.current() == escapeCharacter {
				// Escaped space character.
				builder.WriteRune(ch)
			} else {
				return builder.String(), nil
			}
		} else {
			builder.WriteRune(ch)
		}
		s.index++
	}
	return "", s.error(fmt.Sprintf("reached end of symbol while parsing <%s>, expected a '%v' character", what, string(escapeCharacter)))
}

func (s *symbolParser) acceptCharacter(r rune, what string) error {
	if s.current() == r {
		s.index++
		return nil
	}
	return s.error(fmt.Sprintf("expected '%v', obtained '%v', while parsing %v", string(r), string(s.current()), what))
}
