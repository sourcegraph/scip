package main

import (
	"strings"
	"testing"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"google.golang.org/protobuf/proto"
)

func TestDeserializeOccurrencesFromBlob_ValidRanges(t *testing.T) {
	// Create a test document with valid occurrences
	testDoc := &scip.Document{
		Occurrences: []*scip.Occurrence{
			// Case 1: 3-element range [line, startChar, endChar]
			{
				Range:       []int32{100, 10, 20},
				Symbol:      "test-symbol-1",
				SymbolRoles: int32(scip.SymbolRole_Definition),
			},
			// Case 2: 4-element range [startLine, startChar, endLine, endChar]
			{
				Range:       []int32{200, 5, 200, 15},
				Symbol:      "test-symbol-2",
				SymbolRoles: int32(scip.SymbolRole_Reference),
			},
			// Case 3: Multi-line range
			{
				Range:       []int32{300, 8, 301, 10},
				Symbol:      "test-symbol-3",
				SymbolRoles: int32(scip.SymbolRole_Reference),
			},
		},
	}

	// Serialize the document
	blob, err := proto.Marshal(testDoc)
	if err != nil {
		t.Fatalf("Failed to marshal test document: %v", err)
	}

	// Deserialize and check the results
	occurrences, err := DeserializeOccurrencesFromBlob(blob)
	if err != nil {
		t.Fatalf("DeserializeOccurrencesFromBlob failed: %v", err)
	}

	// Verify that we got all the occurrences
	if len(occurrences) != 3 {
		t.Errorf("Expected 3 occurrences, got %d", len(occurrences))
	}

	// Test case 1: 3-element range
	if occurrences[0].StartLine != 100 || occurrences[0].StartChar != 10 ||
		occurrences[0].EndLine != 100 || occurrences[0].EndChar != 20 {
		t.Errorf("Case 1 failed: got range [%d,%d,%d,%d], expected [100,10,100,20]",
			occurrences[0].StartLine, occurrences[0].StartChar,
			occurrences[0].EndLine, occurrences[0].EndChar)
	}

	// Test case 2: 4-element range
	if occurrences[1].StartLine != 200 || occurrences[1].StartChar != 5 ||
		occurrences[1].EndLine != 200 || occurrences[1].EndChar != 15 {
		t.Errorf("Case 2 failed: got range [%d,%d,%d,%d], expected [200,5,200,15]",
			occurrences[1].StartLine, occurrences[1].StartChar,
			occurrences[1].EndLine, occurrences[1].EndChar)
	}

	// Test case 3: Multi-line range
	if occurrences[2].StartLine != 300 || occurrences[2].StartChar != 8 ||
		occurrences[2].EndLine != 301 || occurrences[2].EndChar != 10 {
		t.Errorf("Case 3 failed: got range [%d,%d,%d,%d], expected [300,8,301,10]",
			occurrences[2].StartLine, occurrences[2].StartChar,
			occurrences[2].EndLine, occurrences[2].EndChar)
	}
}

func TestDeserializeOccurrencesFromBlob_InvalidRanges(t *testing.T) {
	// Test 1: endLine < startLine
	testInvalidEndLine := func(t *testing.T) {
		testDoc := &scip.Document{
			Occurrences: []*scip.Occurrence{
				{
					Range:       []int32{300, 8, 200, 10}, // endLine < startLine
					Symbol:      "test-symbol",
					SymbolRoles: int32(scip.SymbolRole_Reference),
				},
			},
		}

		blob, _ := proto.Marshal(testDoc)

		// This should panic
		DeserializeOccurrencesFromBlob(blob)
	}

	// Test 2: endLine == startLine but endChar < startChar
	testInvalidEndChar := func(t *testing.T) {
		testDoc := &scip.Document{
			Occurrences: []*scip.Occurrence{
				{
					Range:       []int32{300, 20, 300, 10}, // endChar < startChar
					Symbol:      "test-symbol",
					SymbolRoles: int32(scip.SymbolRole_Reference),
				},
			},
		}

		blob, _ := proto.Marshal(testDoc)

		// This should panic
		DeserializeOccurrencesFromBlob(blob)
	}

	// Test 3: endLine == 0 but startLine > 0
	testZeroEndLine := func(t *testing.T) {
		testDoc := &scip.Document{
			Occurrences: []*scip.Occurrence{
				{
					Range:       []int32{300, 8, 0, 0}, // endLine is 0
					Symbol:      "test-symbol",
					SymbolRoles: int32(scip.SymbolRole_Reference),
				},
			},
		}

		blob, _ := proto.Marshal(testDoc)

		// This should panic
		DeserializeOccurrencesFromBlob(blob)
	}

	// Run each test inside a recovery block
	t.Run("EndLineLessThanStartLine", func(t *testing.T) {
		defer func() {
			r := recover()
			if r == nil {
				t.Error("Expected panic for endLine < startLine, but no panic occurred")
			} else {
				errMsg, ok := r.(string)
				if !ok || !strings.Contains(errMsg, "endLine") {
					t.Errorf("Expected panic message about endLine, got: %v", r)
				}
			}
		}()
		testInvalidEndLine(t)
	})

	t.Run("EndCharLessThanStartChar", func(t *testing.T) {
		defer func() {
			r := recover()
			if r == nil {
				t.Error("Expected panic for endChar < startChar, but no panic occurred")
			} else {
				errMsg, ok := r.(string)
				if !ok || !strings.Contains(errMsg, "endChar") {
					t.Errorf("Expected panic message about endChar, got: %v", r)
				}
			}
		}()
		testInvalidEndChar(t)
	})

	t.Run("ZeroEndLineWithNonzeroStartLine", func(t *testing.T) {
		defer func() {
			r := recover()
			if r == nil {
				t.Error("Expected panic for endLine=0 with startLine>0, but no panic occurred")
			} else {
				errMsg, ok := r.(string)
				if !ok || !strings.Contains(errMsg, "endLine is 0") {
					t.Errorf("Expected panic message about zero endLine, got: %v", r)
				}
			}
		}()
		testZeroEndLine(t)
	})
}

func TestFindLineRange_InvalidRanges(t *testing.T) {
	// Test case where endLine < startLine should panic
	t.Run("EndLineLessThanStartLine", func(t *testing.T) {
		defer func() {
			r := recover()
			if r == nil {
				t.Error("Expected panic for endLine < startLine in findLineRange, but no panic occurred")
			} else {
				errMsg, ok := r.(string)
				if !ok || !strings.Contains(errMsg, "findLineRange") {
					t.Errorf("Expected panic from findLineRange, got: %v", r)
				}
			}
		}()

		occurrences := []*scip.Occurrence{
			{
				Range: []int32{200, 8, 100, 10}, // endLine < startLine
			},
		}

		// This should panic
		findLineRange(occurrences)
	})
}
