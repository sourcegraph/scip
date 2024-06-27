package scip

import (
	"fmt"
	"strings"
	"unicode"

	"github.com/sourcegraph/beaut"

	"github.com/sourcegraph/sourcegraph/lib/errors"
)

// IsGlobalSymbol returns true if the symbol is obviously not a local symbol.
//
// CAUTION: Does not perform full validation of the symbol string's contents.
func IsGlobalSymbol(symbol string) bool {
	return !IsLocalSymbol(symbol)
}

// IsLocalSymbol returns true if the symbol is obviously not a global symbol.
//
// CAUTION: Does not perform full validation of the symbol string's contents.
func IsLocalSymbol(symbol string) bool {
	return strings.HasPrefix(symbol, "local ")
}

func isSimpleIdentifier(s string) bool {
	for _, c := range s {
		if ('0' <= c && c <= '9') || ('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') ||
			c == '$' || c == '+' || c == '-' || c == '_' {
			continue
		}
		return false
	}
	return true
}

func tryParseLocalSymbol(symbol string) (string, error) {
	if !strings.HasPrefix(symbol, "local ") {
		return "", nil
	}
	suffix := symbol[6:]
	if len(suffix) > 0 && isSimpleIdentifier(suffix) {
		return suffix, nil
	}
	return "", errors.Newf("expected format 'local <simple-identifier>' but got: %v", symbol)
}

// ParseSymbol parses an SCIP string into the Symbol message.
//
// Prefer using ParseSymbolUTF8 for strings already known to
// be valid UTF-8 encoded strings. For example, the Protobuf
// string type is guaranteed to be converted to a UTF-8 string
// in Go, you can avoid an extra UTF-8 validity check with
// this API.
func ParseSymbol(symbol string) (*Symbol, error) {
	s, err := beaut.NewUTF8String(symbol)
	if err != nil {
		return nil, err
	}
	return ParseSymbolUTF8(s)
}

// ParseSymbolUTF8 parses an SCIP string into the Symbol message.
//
// Unlike ParseSymbol, this skips UTF-8 validation.
func ParseSymbolUTF8(symbol beaut.UTF8String) (*Symbol, error) {
	return ParsePartialSymbolUTF8(symbol.RawValue(), true)
}

func ParsePartialSymbolUTF8(symbol string, includeDescriptors bool) (*Symbol, error) {
	sym := Symbol{}
	if err := parsePartialSymbolV2(symbol, includeDescriptors, &sym); err != nil {
		return nil, err
	}
	return &sym, nil
}

// ParsePartialSymbol parses an SCIP string into the Symbol message
// with the option to exclude the `.Descriptor` field.
func ParsePartialSymbol(symbol string, includeDescriptors bool) (*Symbol, error) {
	local, err := tryParseLocalSymbol(symbol)
	if err != nil {
		return nil, err
	}
	if local != "" {
		return newLocalSymbol(local), nil
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
	var descriptors []*Descriptor
	if includeDescriptors {
		descriptors, err = s.parseDescriptors()
	}
	return &Symbol{
		Scheme: scheme,
		Package: &Package{
			Manager: manager,
			Name:    packageName,
			Version: packageVersion,
		},
		Descriptors: descriptors,
	}, err
}

// ParsePartialSymbol parses an SCIP string into the Symbol message
// with the option to exclude the `.Descriptor` field.
func parsePartialSymbolV2(symbol string, includeDescriptors bool, out *Symbol) error {
	isLocal, err := tryParseLocalSymbolV2(symbol, out)
	if err != nil || isLocal {
		return err
	}
	z := newZeroAllocSymbolParser(symbol)
	out.Scheme, err = z.acceptSpaceEscapedIdentifier(parseCtxScheme)
	if err != nil {
		return err
	}
	manager, err := z.acceptSpaceEscapedIdentifier(parseCtxPackageManager)
	if err != nil {
		return err
	}
	if manager == "." {
		manager = ""
	}
	packageName, err := z.acceptSpaceEscapedIdentifier(parseCtxPackageName)
	if err != nil {
		return err
	}
	if packageName == "." {
		packageName = ""
	}
	packageVersion, err := z.acceptSpaceEscapedIdentifier(parseCtxPackageVersion)
	if err != nil {
		return err
	}
	if packageVersion == "." {
		packageVersion = ""
	}
	if p := out.Package; p != nil {
		p.Manager = manager
		p.Name = packageName
		p.Version = packageVersion
	} else {
		out.Package = &Package{
			Manager: manager,
			Name:    packageName,
			Version: packageVersion,
		}
	}

	var descriptors RawDescriptorList
	if includeDescriptors {
		if err := z.parseDescriptors(&descriptors); err != nil {
			return err
		}
		if out.Descriptors == nil {
			out.Descriptors = make([]*Descriptor, 0, descriptors.Len())
		}
		descriptors.copyToSlice(&out.Descriptors)
	}
	return nil
}

func tryParseLocalSymbolV2(s string, out *Symbol) (bool, error) {
	suffix := strings.TrimPrefix(s, "local ")
	if len(suffix) == len(s) {
		return false, nil
	}
	if isSimpleIdentifier(suffix) {
		out.Scheme = "local"
		out.Package = nil
		if len(out.Descriptors) == 0 {
			out.Descriptors = []*Descriptor{{Name: suffix, Suffix: Descriptor_Local}}
		} else {
			d := out.Descriptors[0]
			d.Name = suffix
			d.Disambiguator = ""
			d.Suffix = Descriptor_Local
			out.Descriptors = out.Descriptors[:1]
		}
		return true, nil
	}
	return false, expectedSimpleIdentifierError{suffix}
}

type expectedSimpleIdentifierError struct {
	s string
}

func (e expectedSimpleIdentifierError) Error() string {
	return fmt.Sprintf("expected format 'local <simple-identifier>' but got: %v", e.s)
}

func newLocalSymbol(id string) *Symbol {
	return &Symbol{
		Scheme: "local",
		Descriptors: []*Descriptor{
			{Name: id, Suffix: Descriptor_Local},
		},
	}
}

const descriptorArraySize = 4

type RawDescriptorList struct {
	ArrayCount       int
	FixedDescriptors [descriptorArraySize]RawDescriptor // TODO: Optimize this based on benchmarks
	ExtraDescriptors []RawDescriptor
}

func (dl *RawDescriptorList) pushDescriptor(name string, suffix Descriptor_Suffix) {
	if dl.ArrayCount < descriptorArraySize {
		dl.FixedDescriptors[dl.ArrayCount] = RawDescriptor{Name: name, Suffix: suffix}
		dl.ArrayCount++
		return
	}
	dl.ExtraDescriptors = append(dl.ExtraDescriptors, RawDescriptor{Name: name, Suffix: suffix})
}

func (dl *RawDescriptorList) copyToSlice(out *[]*Descriptor) {
	totalCount := dl.Len()
	if len(*out) > totalCount {
		*out = (*out)[:totalCount]
	} else {
		nAppends := totalCount - len(*out)
		for i := 0; i < nAppends; i++ {
			*out = append(*out, &Descriptor{})
		}
	}
	if dl.ArrayCount == 0 {
		return
	}
	for i := 0; i < dl.ArrayCount; i++ {
		d := dl.FixedDescriptors[i]
		(*out)[i].Name = d.Name
		(*out)[i].Disambiguator = d.Disambiguator
		(*out)[i].Suffix = d.Suffix
	}
	for idx, d := range dl.ExtraDescriptors {
		i := dl.ArrayCount + idx
		(*out)[i].Name = d.Name
		(*out)[i].Disambiguator = d.Disambiguator
		(*out)[i].Suffix = d.Suffix
	}
}

func (dl *RawDescriptorList) Len() int {
	return dl.ArrayCount + len(dl.ExtraDescriptors)
}

func (dl *RawDescriptorList) pushDescriptorWithDisambiguator(name string, disamb string, suffix Descriptor_Suffix) {
	if dl.ArrayCount < descriptorArraySize {
		dl.FixedDescriptors[dl.ArrayCount] = RawDescriptor{Name: name, Disambiguator: disamb, Suffix: suffix}
		dl.ArrayCount++
		return
	}
	dl.ExtraDescriptors = append(dl.ExtraDescriptors, RawDescriptor{Name: name, Disambiguator: disamb, Suffix: suffix})
}

type RawDescriptor struct { // TODO: This should be updated based on scip.proto
	Name          string
	Disambiguator string
	Suffix        Descriptor_Suffix
}

type zeroAllocSymbolParser struct {
	SymbolString    string
	byteIndex       int
	currentRune     rune
	bytesToNextRune int32
}

type symbolParser struct {
	Symbol       []rune
	index        int
	SymbolString string
}

// Pre-condition: string is well-formed UTF-8
// Pre-condition: byteIndex is in bounds
func findRuneAtIndex(s string, byteIndex int) (r rune, bytesRead int32) {
	b1 := s[byteIndex]
	if b1 < 0x80 {
		return rune(b1), 1
	}
	b2 := s[byteIndex+1]
	if b1&0b11100000 == 0b11000000 {
		return (int32(b1&0b00011111) << 6) | int32(b2&0b00111111), 2
	}
	b3 := s[byteIndex+2]
	if b1&0b11110000 == 0b11100000 {
		return (int32(b1&0b00001111) << 12) | (int32(b2&0b00111111) << 6) | int32(b3&0b00111111), 3
	}
	b4 := s[byteIndex+3]
	return (int32(b1&0b00000111) << 18) | (int32(b2&0b00111111) << 12) | (int32(b3&0b00111111) << 6) | int32(b4&0b00111111), 4
}

// Pre-condition: string is well-formed UTF-8
// Pre-condition: len(symbol) > 0
func newZeroAllocSymbolParser(symbol string) zeroAllocSymbolParser {
	r, bytesRead := findRuneAtIndex(symbol, 0)
	return zeroAllocSymbolParser{
		SymbolString:    symbol,
		byteIndex:       0,
		currentRune:     r,
		bytesToNextRune: bytesRead,
	}
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

type errorCase int

const (
	errorCaseEmptyIdent errorCase = iota
	errorCaseByteNotFound
)

// Add linter for exhaustivity warning
type parseCtx int

func (what parseCtx) String() string {
	switch what {
	case parseCtxParameterName:
		return "parameter name"
	case parseCtxClosingParameterName:
		return "closing parameter name"
	case parseCtxTypeParameterName:
		return "type parameter name"
	case parseCtxClosingTypeParameterName:
		return "closing type parameter name"
	case parseCtxDescriptorName:
		return "descriptor name"
	case parseCtxMethodDisambiguator:
		return "method disambiguator"
	case parseCtxClosingMethod:
		return "closing method"
	case parseCtxScheme:
		return "scheme"
	case parseCtxPackageManager:
		return "package manager"
	case parseCtxPackageName:
		return "package name"
	case parseCtxPackageVersion:
		return "package version"
	default:
		return "unknown parseCtx"
	}
}

const (
	parseCtxParameterName = iota
	parseCtxClosingParameterName
	parseCtxTypeParameterName
	parseCtxClosingTypeParameterName
	parseCtxDescriptorName
	parseCtxMethodDisambiguator
	parseCtxClosingMethod
	parseCtxScheme
	parseCtxPackageManager
	parseCtxPackageName
	parseCtxPackageVersion
)

func (z *zeroAllocSymbolParser) error(e errorCase, what parseCtx) error {
	// TODO: Reduce number of allocations here.
	panic("TODO: Implement this with minimal allocations")
	//return errors.Newf("%s\n%s\n%s^", message, z.SymbolString, strings.Repeat("_", z.index))
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

func (z *zeroAllocSymbolParser) peekNext() (rune, int32) {
	if z.byteIndex+1 < len(z.SymbolString) {
		return findRuneAtIndex(z.SymbolString, z.byteIndex+int(z.bytesToNextRune))
	}
	return 0, 0
}

func (s *symbolParser) parseDescriptors() ([]*Descriptor, error) {
	var result []*Descriptor
	for s.index < len(s.Symbol) {
		descriptor, err := s.parseDescriptor()
		if err != nil {
			return nil, err
		}
		result = append(result, descriptor)
	}
	return result, nil
}

func (z *zeroAllocSymbolParser) parseDescriptors(out *RawDescriptorList) error {
	for z.byteIndex < len(z.SymbolString) {
		if err := z.parseDescriptor(out); err != nil {
			return err
		}
	}
	return nil
}

func (s *symbolParser) parseDescriptor() (*Descriptor, error) {
	start := s.index
	switch s.peekNext() {
	case '(':
		s.index++
		name, err := s.acceptIdentifier("parameter name")
		if err != nil {
			return nil, err
		}
		return &Descriptor{Name: name, Suffix: Descriptor_Parameter}, s.acceptCharacter(')', "closing parameter name")
	case '[':
		s.index++
		name, err := s.acceptIdentifier("type parameter name")
		if err != nil {
			return nil, err
		}
		return &Descriptor{Name: name, Suffix: Descriptor_TypeParameter}, s.acceptCharacter(']', "closing type parameter name")
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
			return &Descriptor{Name: name, Disambiguator: disambiguator, Suffix: Descriptor_Method}, s.acceptCharacter('.', "closing method")
		case '/':
			return &Descriptor{Name: name, Suffix: Descriptor_Namespace}, nil
		case '.':
			return &Descriptor{Name: name, Suffix: Descriptor_Term}, nil
		case '#':
			return &Descriptor{Name: name, Suffix: Descriptor_Type}, nil
		case ':':
			return &Descriptor{Name: name, Suffix: Descriptor_Meta}, nil
		case '!':
			return &Descriptor{Name: name, Suffix: Descriptor_Macro}, nil
		default:
		}
	}

	end := s.index
	if s.index > len(s.Symbol) {
		end = len(s.Symbol)
	}
	return nil, errors.Newf("unrecognized descriptor %q", string(s.Symbol[start:end]))
}

func (z *zeroAllocSymbolParser) Advance(nextRune rune, nextRuneByteLength int32) {
	z.byteIndex += int(z.bytesToNextRune)
	z.currentRune = nextRune
	z.bytesToNextRune = nextRuneByteLength
}

func (z *zeroAllocSymbolParser) parseDescriptor(out *RawDescriptorList) error {
	start := z.byteIndex
	nextRune, nextRuneByteLength := z.peekNext()
	switch nextRune {
	case '(':
		z.Advance('(', nextRuneByteLength)
		z.advanceRune()
		name, err := z.acceptIdentifier(parseCtxParameterName)
		if err != nil {
			return err
		}
		out.pushDescriptor(name, Descriptor_Parameter)
		return z.acceptOneByte(')', parseCtxClosingParameterName)
		//return &Descriptor{Name: name, Suffix: Descriptor_Parameter}, z.acceptCharacter(')', "closing parameter name")
	case '[':
		z.Advance('[', nextRuneByteLength)
		z.advanceRune()
		name, err := z.acceptIdentifier(parseCtxTypeParameterName)
		if err != nil {
			return err
		}
		out.pushDescriptor(name, Descriptor_TypeParameter)
		return z.acceptOneByte(']', parseCtxClosingTypeParameterName)
	default:
		name, err := z.acceptIdentifier(parseCtxDescriptorName)
		if err != nil {
			return err
		}
		suffixRune := z.currentRune
		z.advanceRune()
		switch suffixRune {
		case '(':
			disambiguator := ""
			if z.currentRune != ')' {
				disambiguator, err = z.acceptIdentifier(parseCtxMethodDisambiguator)
				if err != nil {
					return err
				}
			}
			err = z.acceptOneByte(')', parseCtxClosingMethod)
			if err != nil {
				return err
			}
			out.pushDescriptorWithDisambiguator(name, disambiguator, Descriptor_Method)
			return z.acceptOneByte('.', parseCtxClosingMethod)
		case '/':
			out.pushDescriptor(name, Descriptor_Namespace)
			return nil
		case '.':
			out.pushDescriptor(name, Descriptor_Term)
			return nil
		case '#':
			out.pushDescriptor(name, Descriptor_Type)
			return nil
		case ':':
			out.pushDescriptor(name, Descriptor_Meta)
			return nil
		case '!':
			out.pushDescriptor(name, Descriptor_Macro)
			return nil
		default:
		}
	}

	end := z.byteIndex
	if z.byteIndex > len(z.SymbolString) {
		end = len(z.SymbolString)
	}
	return unrecognizedDescriptorError{z.SymbolString[start:end]}
}

type unrecognizedDescriptorError struct {
	value string
}

var _ error = unrecognizedDescriptorError{}

func (e unrecognizedDescriptorError) Error() string {
	return fmt.Sprintf("unrecognized descriptor %q", e.value)
}

func (s *symbolParser) acceptIdentifier(what string) (string, error) {
	if s.current() == '`' {
		s.index++
		return s.acceptBacktickEscapedIdentifier(what)
	}
	start := s.index
	for s.index < len(s.Symbol) && isIdentifierCharacter(s.current()) {
		s.index++
	}
	if start == s.index {
		return "", s.error("empty identifier")
	}
	return string(s.Symbol[start:s.index]), nil
}

func (z *zeroAllocSymbolParser) advanceOneByte(_ byte) {
	// TODO: Add build tag with asserts and check that current byte matches the passed in byte.
	nextRune, nextRuneByteLength := z.peekNext()
	z.Advance(nextRune, nextRuneByteLength)
}

func (z *zeroAllocSymbolParser) advanceRune() {
	nextRune, nextRuneByteLength := z.peekNext()
	z.Advance(nextRune, nextRuneByteLength)
}

func (z *zeroAllocSymbolParser) acceptOneByte(b byte, what parseCtx) error {
	if z.currentRune == rune(b) {
		z.advanceOneByte(b)
		return nil
	}
	return z.error(errorCaseByteNotFound, what)
}

func (z *zeroAllocSymbolParser) acceptIdentifier(what parseCtx) (string, error) {
	if z.currentRune == '`' {
		z.advanceOneByte('`')
		return z.acceptBacktickEscapedIdentifier(what)
	}
	start := z.byteIndex
	slen := len(z.SymbolString)
	for z.byteIndex < slen {
		if !isIdentifierCharacter(z.currentRune) {
			break
		}
		z.advanceRune()
	}
	if start == z.byteIndex {
		return "", z.error(errorCaseEmptyIdent, what)
	}
	return z.SymbolString[start:z.byteIndex], nil
}

func (z *zeroAllocSymbolParser) acceptBacktickEscapedIdentifier(what parseCtx) (string, error) {
	return z.acceptTerminatedIdentifier(what, '`')
}

func (z *zeroAllocSymbolParser) acceptSpaceEscapedIdentifier(what parseCtx) (string, error) {
	return z.acceptTerminatedIdentifier(what, ' ')
}

// consecutive occurrences of terminator are interpreted as a single literal character
// Otherwise, parsing is terminated.
func (z *zeroAllocSymbolParser) acceptTerminatedIdentifier(what parseCtx, terminator byte) (string, error) {
	builder := strings.Builder{}
	slen := len(z.SymbolString)
	terminatorRune := int32(terminator)
	anchor := z.byteIndex
	hasEscapedTerminator := false
	for z.byteIndex < slen {
		if z.currentRune != terminatorRune {
			z.advanceRune()
			continue
		}
		z.advanceOneByte(terminator)
		if z.byteIndex == slen {
			break
		}
		if z.currentRune == terminatorRune {
			hasEscapedTerminator = true
			// will include 1 copy of the terminator
			builder.WriteString(z.SymbolString[anchor:z.byteIndex])
			z.advanceOneByte(terminator)
			anchor = z.byteIndex
			continue
		}
		if hasEscapedTerminator {
			// Append the rest to the builder and return
			builder.WriteString(z.SymbolString[anchor : z.byteIndex-1])
			return builder.String(), nil
		}
		// In the non-escaped case, z.byteIndex is already 1-past the
		// terminator, so do an extra -1
		return z.SymbolString[anchor : z.byteIndex-1], nil
	}
	return "", endOfSymbolError{what, terminatorRune}
}

type endOfSymbolError struct {
	what     parseCtx
	expected rune
}

var _ error = endOfSymbolError{}

func (e endOfSymbolError) Error() string {
	return fmt.Sprintf("reached end of symbol while parsing <%s>, expected a '%v' character", e.what, e.expected)
}

func isIdentifierCharacter(r rune) bool {
	return unicode.IsLetter(r) || unicode.IsDigit(r) || r == '-' || r == '+' || r == '$' || r == '_'
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

func (x *Package) ID() string {
	return fmt.Sprintf("%s %s %s", x.Manager, x.Name, x.Version)
}
