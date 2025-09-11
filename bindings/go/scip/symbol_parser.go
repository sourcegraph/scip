package scip

import (
	"fmt"
	"strings"

	"github.com/cockroachdb/errors"
	"github.com/sourcegraph/beaut"
	"github.com/sourcegraph/scip/bindings/go/scip/internal/shared"
)

// stringWriter is a wrapper around a pair of (strings.Builder, *string)
// which can conditionally discard writes.
type stringWriter struct {
	// builder is meant to be used for handling escapes, in which
	// case we cannot get away with slicing the original string,
	// and we need to allocate a new string.
	builder strings.Builder
	// finalCopySlot represents the final destination for the write.
	// If nil, no writes are performed.
	finalCopySlot *string
}

// append appends the given string to the accumulated string.
func (w *stringWriter) append(s string) {
	if w.finalCopySlot == nil {
		return
	}
	w.builder.WriteString(s)
}

// finish copies the accumulated string to the final destination,
// if present.
func (w *stringWriter) finish() {
	if w.finalCopySlot == nil {
		return
	}
	*w.finalCopySlot = w.builder.String()
}

// writeFullAndFinish ignores any previous writes via append calls
// and writes the given string.
func (w *stringWriter) writeFullAndFinish(s string) {
	if w.finalCopySlot == nil {
		return
	}
	*w.finalCopySlot = s
}

// normalize overwrites the string in the slot if it matches 'from'.
func (w *stringWriter) normalize(from string, to string) {
	if w.finalCopySlot == nil || (*w.finalCopySlot != from) {
		return
	}
	*w.finalCopySlot = to
}

func (w *stringWriter) reset(newSlot *string) {
	w.builder.Reset()
	w.finalCopySlot = newSlot
}

// parseSymbolV2 parses an SCIP string into the Symbol message
// with the option to exclude the `.Descriptor` field.
//
// Pre-condition: symbolUTF8 is non-empty.
func parseSymbolV2(symbolUTF8 beaut.UTF8String, includeDescriptors bool, out *Symbol) error {
	symbol := symbolUTF8.RawValue()
	isLocal, err := tryParseLocalSymbolV2(symbol, out)
	if isLocal || err != nil {
		return err
	}
	z := newSymbolParserV2(symbol)
	var sw stringWriter
	if out != nil {
		sw.reset(&out.Scheme)
	}
	if err = z.acceptSpaceEscapedIdentifier(parseCtxScheme, &sw); err != nil {
		return err
	}
	if out != nil {
		if out.Package == nil {
			out.Package = &Package{}
		}
		sw.reset(&out.Package.Manager)
	}
	if err := z.acceptSpaceEscapedIdentifier(parseCtxPackageManager, &sw); err != nil {
		return err
	}
	sw.normalize(".", "")
	if out != nil {
		sw.reset(&out.Package.Name)
	}
	if err := z.acceptSpaceEscapedIdentifier(parseCtxPackageName, &sw); err != nil {
		return err
	}
	sw.normalize(".", "")
	if out != nil {
		sw.reset(&out.Package.Version)
	}
	if err := z.acceptSpaceEscapedIdentifier(parseCtxPackageVersion, &sw); err != nil {
		return err
	}
	sw.normalize(".", "")

	if includeDescriptors {
		var dw descriptorsWriter
		if out != nil {
			dw.shouldWrite = true
			dw.descriptors = out.Descriptors
		}
		if err := z.parseDescriptors(&dw); err != nil {
			return err
		}
		if out != nil {
			out.Descriptors = dw.validDescriptors()
		}
	}
	return nil
}

func tryParseLocalSymbolV2(s string, out *Symbol) (bool, error) {
	suffix := strings.TrimPrefix(s, "local ")
	if len(suffix) == len(s) {
		return false, nil
	}
	if len(suffix) == 0 || !shared.IsSimpleIdentifier(suffix) {
		return false, expectedSimpleIdentifierError{""}
	}
	if out != nil {
		out.Scheme = "local"
		// This is a bit unfortunate; we cannot avoid allocating another Package value
		// in the next parsing call if the next Symbol received is not a local variable.
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
	}
	return true, nil
}

type expectedSimpleIdentifierError struct {
	s string
}

func (e expectedSimpleIdentifierError) Error() string {
	return fmt.Sprintf("expected format 'local <simple-identifier>' but got: %v", e.s)
}

// descriptorsWriter encapsulates the logic for writing descriptors
// while handling the zero-write/validation-only case.
type descriptorsWriter struct {
	// descriptors represents the Descriptor values that should be written
	// to. Only count elements of this slice should be interpreted.
	descriptors []*Descriptor
	// tmpStringWriter will discard writes if shouldWrite is false.
	// Otherwise, it may be a name writer or a disambiguator writer.
	tmpStringWriter stringWriter
	// throwawaySuffix is for the !shouldWrite case, where we still
	// want to provide a uniform type for the caller to "write" the
	// suffix to (i.e. a pointer). If shouldWrite is true,
	// then suffixes will be written to descriptors directly.
	throwawaySuffix Descriptor_Suffix
	count           int32
	// shouldWrite controls if writes should be performed or discarded.
	shouldWrite bool
}

// prepareName appends a descriptor with the given suffix and an empty
// name and disambiguator, and returns a writer for the name.
//
// For writing the disambiguator, use getDisambiguatorForLast after
// calling prepare or prepareName.
//
// Pre-condition: Writes to a previously written writer from {prepare,
// prepareName, getDisambiguatorForLast} must be finished before calling
// any of these methods again.
func (dw *descriptorsWriter) prepareName(suffix Descriptor_Suffix) *stringWriter {
	if dw.shouldWrite {
		dw.tmpStringWriter.builder.Reset()
		dw.tmpStringWriter.finalCopySlot, _ = dw.internalPrepareSlot(suffix)
	}
	return &dw.tmpStringWriter
}

// prepare is similar to prepareName, but allows delaying writing the suffix.
//
// Pre-condition: Writes to a previously written writer from {prepare,
// prepareName, getDisambiguatorForLast} must be finished before calling
// any of these methods again.
func (dw *descriptorsWriter) prepare() (*stringWriter, *Descriptor_Suffix) {
	suffixPtr := &dw.throwawaySuffix
	if dw.shouldWrite {
		dw.tmpStringWriter.builder.Reset()
		dw.tmpStringWriter.finalCopySlot, suffixPtr = dw.internalPrepareSlot(Descriptor_UnspecifiedSuffix)
	}
	return &dw.tmpStringWriter, suffixPtr
}

// getDisambiguatorForLast returns a writer for the disambiguator for the last
// descriptor that was inserted.
//
// Pre-condition: prepare or prepareName must have been called before this.
//
// Pre-condition: Writes to a previously written writer from {prepare,
// prepareName, getDisambiguatorForLast} must be finished before calling
// any of these methods again.
func (dw *descriptorsWriter) getDisambiguatorForLast() *stringWriter {
	if dw.shouldWrite {
		dw.tmpStringWriter.builder.Reset()
		dw.tmpStringWriter.finalCopySlot = &dw.descriptors[dw.count-1].Disambiguator
		return &dw.tmpStringWriter
	}
	return &dw.tmpStringWriter
}

// internalPrepareSlot optionally grows the slice of descriptors, assigns the provided
// suffix to the last descriptor, and returns pointers to the 'Name' and
// 'Suffix' fields for overwriting.
//
// Generally, higher-level code should only call prepare or prepareName.
//
// Pre-condition: This should only be called in the shouldWrite case.
func (dw *descriptorsWriter) internalPrepareSlot(suffix Descriptor_Suffix) (*string, *Descriptor_Suffix) {
	assert(dw.shouldWrite, "should only call internalPrepareSlot in the shouldWrite case")
	zeroLastSlot := func() {
		lastPtr := &dw.descriptors[dw.count]
		if last := *lastPtr; last == nil {
			*lastPtr = &Descriptor{Suffix: suffix}
		} else {
			last.Name = ""
			last.Suffix = suffix
			last.Disambiguator = ""
		}
	}
	if len(dw.descriptors) == int(dw.count) {
		dw.descriptors = append(dw.descriptors, &Descriptor{Suffix: suffix})
	} else {
		zeroLastSlot()
	}
	elt := dw.descriptors[dw.count]
	dw.count++
	nameSlot := &elt.Name
	suffixSlot := &elt.Suffix
	return nameSlot, suffixSlot
}

func (dw *descriptorsWriter) validDescriptors() []*Descriptor {
	return dw.descriptors[:dw.count]
}

// symbolParserV2 parses symbols while minimizing heap allocations.
type symbolParserV2 struct {
	SymbolString string
	// byteIndex is the index in SymbolString for the first byte of currentRune.
	// However, at the end of parsing, this can be equal to len(SymbolString);
	// see advanceOneByte.
	byteIndex       int
	currentRune     rune
	bytesToNextRune int32
}

// findRuneAtIndex returns the rune at the given index.
//
// Pre-condition: string is well-formed UTF-8
// Pre-condition: byteIndex is in bounds
//
// NOTE: We could technically use utf8.DecodeRuneInString here, but that
// has a more complex implementation which tries to handle invalid UTF-8.
// Looking at the code itself, it seems like it would be slower given that
// it is doing more operations.
//
// https://sourcegraph.com/github.com/golang/go/-/blob/src/unicode/utf8/utf8.go?L205-243
//
// It might be worth benchmarking to see if that's faster/doesn't make
// a difference.
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
func newSymbolParserV2(symbol string) symbolParserV2 {
	r, bytesRead := findRuneAtIndex(symbol, 0)
	return symbolParserV2{
		SymbolString:    symbol,
		byteIndex:       0,
		currentRune:     r,
		bytesToNextRune: bytesRead,
	}
}

type errorCase int

const (
	errorCaseEmptyIdent errorCase = iota
	errorCaseByteNotFound
)

// TODO: Enable https://github.com/nishanths/exhaustive in CI
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
	parseCtxParameterName parseCtx = iota
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

func (z *symbolParserV2) error(e errorCase, expectedByte byte, what parseCtx) error {
	switch e {
	case errorCaseEmptyIdent:
		return errors.Newf("failed to parse: %q (context: %v)", z.SymbolString, what)
	case errorCaseByteNotFound:
		return errors.Newf("failed to parse: %q (expected byte: %c, context: %v)", z.SymbolString, rune(expectedByte), what)
	default:
		panic(fmt.Sprintf("unknown error case: %v", e))
	}
}

func (z *symbolParserV2) peekNext() (rune, int32) {
	if z.byteIndex+1 < len(z.SymbolString) {
		return findRuneAtIndex(z.SymbolString, z.byteIndex+int(z.bytesToNextRune))
	}
	return 0, 0
}

func (z *symbolParserV2) parseDescriptors(out *descriptorsWriter) error {
	for z.byteIndex < len(z.SymbolString) {
		if err := z.parseDescriptor(out); err != nil {
			return err
		}
	}
	return nil
}

func (z *symbolParserV2) advance(nextRune rune, nextRuneByteLength int32) {
	z.byteIndex += int(z.bytesToNextRune)
	z.currentRune = nextRune
	z.bytesToNextRune = nextRuneByteLength
}

func (z *symbolParserV2) parseDescriptor(out *descriptorsWriter) error {
	start := z.byteIndex
	switch z.currentRune {
	case '(':
		z.advanceOneByte('(')
		nameWriter := out.prepareName(Descriptor_Parameter)
		if err := z.acceptIdentifier(parseCtxParameterName, nameWriter); err != nil {
			return err
		}
		return z.acceptOneByte(')', parseCtxClosingParameterName)
	case '[':
		z.advanceOneByte('[')
		nameWriter := out.prepareName(Descriptor_TypeParameter)
		if err := z.acceptIdentifier(parseCtxTypeParameterName, nameWriter); err != nil {
			return err
		}
		return z.acceptOneByte(']', parseCtxClosingTypeParameterName)
	default:
		nameWriter, descriptorPtr := out.prepare()
		if err := z.acceptIdentifier(parseCtxDescriptorName, nameWriter); err != nil {
			return err
		}
		suffixRune := z.currentRune
		z.advanceRune()
		switch suffixRune {
		case '(':
			*descriptorPtr = Descriptor_Method
			if z.currentRune != ')' {
				disambWriter := out.getDisambiguatorForLast()
				if err := z.acceptIdentifier(parseCtxMethodDisambiguator, disambWriter); err != nil {
					return err
				}
			}
			if err := z.acceptOneByte(')', parseCtxClosingMethod); err != nil {
				return err
			}
			return z.acceptOneByte('.', parseCtxClosingMethod)
		case '/':
			*descriptorPtr = Descriptor_Namespace
			return nil
		case '.':
			*descriptorPtr = Descriptor_Term
			return nil
		case '#':
			*descriptorPtr = Descriptor_Type
			return nil
		case ':':
			*descriptorPtr = Descriptor_Meta
			return nil
		case '!':
			*descriptorPtr = Descriptor_Macro
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

func (z *symbolParserV2) advanceOneByte(b byte) {
	assert(z.currentRune == rune(b), "passed in byte does not match current rune")
	nextRune, nextRuneByteLength := z.peekNext()
	// CAUTION: z.byteIndex can become equal to len(z.SymbolString) here
	z.byteIndex += 1
	z.currentRune = nextRune
	z.bytesToNextRune = nextRuneByteLength
}

func (z *symbolParserV2) advanceRune() {
	nextRune, nextRuneByteLength := z.peekNext()
	z.advance(nextRune, min(nextRuneByteLength, 1))
}

func (z *symbolParserV2) acceptOneByte(b byte, what parseCtx) error {
	if z.currentRune == rune(b) {
		z.advanceOneByte(b)
		return nil
	}
	return z.error(errorCaseByteNotFound, b, what)
}

func (z *symbolParserV2) acceptIdentifier(what parseCtx, sw *stringWriter) error {
	if z.currentRune == '`' {
		z.advanceOneByte('`')
		return z.acceptBacktickEscapedIdentifier(what, sw)
	}
	start := z.byteIndex
	slen := len(z.SymbolString)
	for z.byteIndex < slen {
		if !shared.IsSimpleIdentifierCharacter(z.currentRune) {
			break
		}
		z.advanceRune()
	}
	if start == z.byteIndex {
		return z.error(errorCaseEmptyIdent, 0, what)
	}
	sw.writeFullAndFinish(z.SymbolString[start:z.byteIndex])
	return nil
}

func (z *symbolParserV2) acceptBacktickEscapedIdentifier(what parseCtx, sw *stringWriter) error {
	return z.acceptTerminatedIdentifier(what, sw, '`')
}

func (z *symbolParserV2) acceptSpaceEscapedIdentifier(what parseCtx, sw *stringWriter) error {
	return z.acceptTerminatedIdentifier(what, sw, ' ')
}

// acceptTerminatedIdentifier accepts an identifier that is terminated by 'terminator'.
//
// Consecutive occurrences of terminator are interpreted as a single literal character.
func (z *symbolParserV2) acceptTerminatedIdentifier(what parseCtx, sw *stringWriter, terminator byte) error {
	slen := len(z.SymbolString)
	terminatorRune := rune(terminator)
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
			sw.append(z.SymbolString[anchor:z.byteIndex])
			z.advanceOneByte(terminator)
			anchor = z.byteIndex
			continue
		}
		if hasEscapedTerminator {
			// Append the rest to the builder and return
			sw.append(z.SymbolString[anchor : z.byteIndex-1])
			sw.finish()
			return nil
		}
		// In the non-escaped case, z.byteIndex is already 1 past the
		// terminator, so do an extra -1
		sw.writeFullAndFinish(z.SymbolString[anchor : z.byteIndex-1])
		return nil
	}
	return endOfSymbolError{what, terminatorRune}
}

type endOfSymbolError struct {
	what     parseCtx
	expected rune
}

var _ error = endOfSymbolError{}

func (e endOfSymbolError) Error() string {
	return fmt.Sprintf("reached end of symbol while parsing <%s>, expected a '%v' character", e.what, e.expected)
}

func (x *Package) ID() string {
	return fmt.Sprintf("%s %s %s", x.Manager, x.Name, x.Version)
}
