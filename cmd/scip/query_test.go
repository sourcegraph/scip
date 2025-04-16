package main

import (
	"encoding/json"
	"io"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"zombiezen.com/go/sqlite"
	"zombiezen.com/go/sqlite/sqlitex"
)

func TestQueryCommands(t *testing.T) {
	// Create a temporary directory for the test
	tmpDir, err := os.MkdirTemp("", "scip-query-test")
	if err != nil {
		t.Fatalf("Failed to create temp directory: %v", err)
	}
	defer os.RemoveAll(tmpDir)

	// Create a test SCIP index
	testIndex := createQueryTestIndex()
	indexPath := filepath.Join(tmpDir, "index.scip")
	writeTestIndex(t, testIndex, indexPath)

	// Output SQLite database path
	dbPath := filepath.Join(tmpDir, "index.db")

	// Run the convert command first to create the database
	err = convertMain(indexPath, dbPath, 100, io.Discard)
	if err != nil {
		t.Fatalf("Convert command failed: %v", err)
	}

	// Verify the database was created
	if _, err := os.Stat(dbPath); os.IsNotExist(err) {
		t.Fatalf("Database file was not created at %s", dbPath)
	}

	// Test goto-definition query
	t.Run("GotoDefinition", func(t *testing.T) {
		var output strings.Builder
		symbol := "go package main/foo()."
		// Use the direct query function - this doesn't test flags, but the underlying functionality
		err := gotoDefinitionQuery(dbPath, symbol, &output)
		if err != nil {
			t.Fatalf("Goto definition query failed: %v", err)
		}

		// Parse the JSON result
		var locations []Location
		err = json.Unmarshal([]byte(strings.TrimSpace(output.String())), &locations)
		if err != nil {
			t.Fatalf("Failed to parse JSON result: %v", err)
		}

		// Verify we get the expected location
		if len(locations) != 1 {
			t.Fatalf("Expected 1 location, got %d", len(locations))
		}

		loc := locations[0]
		if loc.Path != "src/main.go" || loc.Line != 2 || loc.Role != "definition" {
			t.Errorf("Unexpected location: %+v", loc)
		}
	})

	// Test find-references query
	t.Run("FindReferences", func(t *testing.T) {
		var output strings.Builder
		symbol := "go package main/foo()."
		// Use the direct query function - this bypasses the CLI flags
		err := findReferencesQuery(dbPath, symbol, &output)
		if err != nil {
			t.Fatalf("Find references query failed: %v", err)
		}

		// Parse the JSON result
		var locations []Location
		err = json.Unmarshal([]byte(strings.TrimSpace(output.String())), &locations)
		if err != nil {
			t.Fatalf("Failed to parse JSON result: %v", err)
		}

		// Should find at least 2 locations: the definition and the reference
		if len(locations) < 2 {
			t.Fatalf("Expected at least 2 locations, got %d", len(locations))
		}

		// Count definitions and references
		defCount := 0
		refCount := 0
		for _, loc := range locations {
			if loc.Role == "definition" {
				defCount++
			} else if loc.Role == "reference" {
				refCount++
			}
		}

		// Verify we have at least one definition and one reference
		if defCount < 1 || refCount < 1 {
			t.Errorf("Expected at least one definition and one reference, got %d definitions and %d references", defCount, refCount)
		}
	})

	// Verify the database has the expected structures
	db, err := sqlite.OpenConn(dbPath, sqlite.OpenReadOnly)
	if err != nil {
		t.Fatalf("Failed to open database: %v", err)
	}
	defer db.Close()

	// Check if the defn_trees table is populated
	var defnTreesCount int64
	err = sqlitex.Execute(db, "SELECT COUNT(*) FROM defn_trees", &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			defnTreesCount = stmt.ColumnInt64(0)
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to query defn_trees: %v", err)
	}
	t.Logf("Database contains %d rows in defn_trees table", defnTreesCount)

	// Test call-hierarchy query
	t.Run("CallHierarchy", func(t *testing.T) {
		var output strings.Builder
		symbol := "go package main/foo()."
		// Use the direct query function - this bypasses the CLI flags
		err := callHierarchyQuery(dbPath, symbol, 3, &output)
		if err != nil {
			t.Fatalf("Call hierarchy query failed: %v", err)
		}

		// Parse the JSON result
		var entries []FlatCallHierarchyEntry
		err = json.Unmarshal([]byte(strings.TrimSpace(output.String())), &entries)
		if err != nil {
			t.Fatalf("Failed to parse JSON result: %v", err)
		}

		// Check for complete call hierarchy relationships
		foundBar := false
		foundBaz := false
		foundMain := false

		// Check if the relationships exist in the flat structure
		for _, entry := range entries {
			if entry.Callee == symbol && entry.Caller.Symbol == "go package main/bar()." {
				foundBar = true
			}

			if entry.Callee == "go package main/bar()." && entry.Caller.Symbol == "go package main/baz()." {
				foundBaz = true
			}

			if entry.Callee == "go package main/baz()." && entry.Caller.Symbol == "go package main/main()." {
				foundMain = true
			}
		}

		// Validate the relationships were found
		t.Logf("Call hierarchy: foo->bar: %v, bar->baz: %v, baz->main: %v",
			foundBar, foundBaz, foundMain)

		// There should be at least the first level of relationships
		if !foundBar {
			t.Errorf("Missing bar->foo relationship in call hierarchy")
		}

		// Make sure we're getting call sites too
		hasCallSites := false
		for _, entry := range entries {
			if len(entry.CallSites) > 0 {
				hasCallSites = true
				break
			}
		}

		if !hasCallSites {
			t.Errorf("Expected at least one entry to have call sites, but none found")
		}
	})
}

func TestAckermannCallHierarchy(t *testing.T) {
	// Create a temporary directory for the test
	tmpDir, err := os.MkdirTemp("", "scip-ackermann-test")
	if err != nil {
		t.Fatalf("Failed to create temp directory: %v", err)
	}
	defer os.RemoveAll(tmpDir)

	// Create a test SCIP index for the Ackermann function
	testIndex := createAckermannTestIndex()
	indexPath := filepath.Join(tmpDir, "ackermann.scip")
	writeTestIndex(t, testIndex, indexPath)

	// Output SQLite database path
	dbPath := filepath.Join(tmpDir, "ackermann.db")

	// Run the convert command first to create the database
	err = convertMain(indexPath, dbPath, 100, io.Discard)
	if err != nil {
		t.Fatalf("Convert command failed: %v", err)
	}

	// Verify the database was created
	if _, err := os.Stat(dbPath); os.IsNotExist(err) {
		t.Fatalf("Database file was not created at %s", dbPath)
	}

	// Run call hierarchy query for Ackermann function
	var output strings.Builder
	symbol := "go package ackermann/ack(int,int)."

	// Use the direct query function
	err = callHierarchyQuery(dbPath, symbol, 3, &output)
	if err != nil {
		t.Fatalf("Call hierarchy query failed: %v", err)
	}

	// Parse the JSON result
	var entries []FlatCallHierarchyEntry
	err = json.Unmarshal([]byte(strings.TrimSpace(output.String())), &entries)
	if err != nil {
		t.Fatalf("Failed to parse JSON result: %v", err)
	}

	// We should have one entry where Ackermann calls itself
	found := false
	selfCallCount := 0

	// Look for the self-referential node
	for _, entry := range entries {
		if entry.Caller.Symbol == symbol && entry.Callee == symbol {
			found = true
			// Should have exactly three references (three recursive calls)
			selfCallCount = len(entry.CallSites)
		}
	}

	// Verify we found the self-reference with two calls
	if !found {
		t.Error("Did not find self-referential call in Ackermann function")
	}

	// Verify there are exactly three references (the three recursive calls)
	if selfCallCount != 3 {
		t.Errorf("Expected 3 self-references in Ackermann function, got %d", selfCallCount)
	}
}

// createAckermannTestIndex creates a test index with Ackermann function that has three recursive calls
func createAckermannTestIndex() *scip.Index {
	return &scip.Index{
		Metadata: &scip.Metadata{
			Version:              0,
			ToolInfo:             &scip.ToolInfo{Name: "test-indexer", Version: "1.0.0"},
			ProjectRoot:          "file:///project",
			TextDocumentEncoding: scip.TextEncoding_UTF8,
		},
		Documents: []*scip.Document{
			{
				RelativePath:     "ackermann.go",
				Language:         "go",
				Text:             "package ackermann\n\nfunc ack(m, n int) int {\n\tif m == 0 {\n\t\treturn n + 1\n\t} else if n == 0 {\n\t\treturn ack(m-1, 1)\n\t} else {\n\t\treturn ack(m-1, ack(m, n-1))\n\t}\n}\n",
				PositionEncoding: scip.PositionEncoding_UTF8CodeUnitOffsetFromLineStart,
				Occurrences: []*scip.Occurrence{
					// Package definition
					{
						Range:          []int32{0, 8, 0, 17},
						Symbol:         "go package ackermann",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{0, 0, 11, 1},
					},
					// Function definition
					{
						Range:          []int32{2, 5, 2, 8},
						Symbol:         "go package ackermann/ack(int,int).",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{2, 0, 10, 1},
					},
					// First recursive call: ack(m-1, 1)
					{
						Range:       []int32{6, 9, 6, 12},
						Symbol:      "go package ackermann/ack(int,int).",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
					// Second recursive call (inner): ack(m, n-1)
					{
						Range:       []int32{8, 23, 8, 26},
						Symbol:      "go package ackermann/ack(int,int).",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
					// Third recursive call (outer): ack(m-1, ...)
					{
						Range:       []int32{8, 9, 8, 12},
						Symbol:      "go package ackermann/ack(int,int).",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
				},
				Symbols: []*scip.SymbolInformation{
					{
						Symbol:        "go package ackermann",
						DisplayName:   "ackermann",
						Documentation: []string{"Ackermann package"},
						Kind:          scip.SymbolInformation_Package,
					},
					{
						Symbol:        "go package ackermann/ack(int,int).",
						DisplayName:   "ack",
						Documentation: []string{"Ackermann function"},
						Kind:          scip.SymbolInformation_Function,
					},
				},
			},
		},
	}
}

func TestCallerFilteringCallHierarchy(t *testing.T) {
	// Create a temporary directory for the test
	tmpDir, err := os.MkdirTemp("", "scip-caller-filter-test")
	if err != nil {
		t.Fatalf("Failed to create temp directory: %v", err)
	}
	defer os.RemoveAll(tmpDir)

	// Create a test SCIP index with different symbol types
	testIndex := createCallerFilterTestIndex()
	indexPath := filepath.Join(tmpDir, "caller-filter.scip")
	writeTestIndex(t, testIndex, indexPath)

	// Output SQLite database path
	dbPath := filepath.Join(tmpDir, "caller-filter.db")

	// Run the convert command first to create the database
	err = convertMain(indexPath, dbPath, 100, io.Discard)
	if err != nil {
		t.Fatalf("Convert command failed: %v", err)
	}

	// Verify the database was created
	if _, err := os.Stat(dbPath); os.IsNotExist(err) {
		t.Fatalf("Database file was not created at %s", dbPath)
	}

	// Run call hierarchy query for target symbol
	var output strings.Builder
	symbol := "go package example/targetFunc()."
	
	// Use the direct query function
	err = callHierarchyQuery(dbPath, symbol, 3, &output)
	if err != nil {
		t.Fatalf("Call hierarchy query failed: %v", err)
	}

	// Parse the JSON result
	var entries []FlatCallHierarchyEntry
	err = json.Unmarshal([]byte(strings.TrimSpace(output.String())), &entries)
	if err != nil {
		t.Fatalf("Failed to parse JSON result: %v", err)
	}

	// Verify we only got method/function callers (ending with ").") and not class/namespace symbols
	methodCount := 0
	nonMethodCount := 0

	for _, entry := range entries {
		if strings.HasSuffix(entry.Caller.Symbol, ").") {
			methodCount++
		} else {
			nonMethodCount++
			t.Errorf("Found non-method/function caller: %s", entry.Caller.Symbol)
		}
	}

	// We should have only method callers
	if nonMethodCount > 0 {
		t.Errorf("Found %d non-method/function callers when there should be 0", nonMethodCount)
	}

	// We should have at least one method caller
	if methodCount == 0 {
		t.Error("No method/function callers found at all")
	} else {
		t.Logf("Found %d method/function callers as expected", methodCount)
	}
}

// createCallerFilterTestIndex creates a test index with different symbol types for caller filtering test
func createCallerFilterTestIndex() *scip.Index {
	return &scip.Index{
		Metadata: &scip.Metadata{
			Version:              0,
			ToolInfo:             &scip.ToolInfo{Name: "test-indexer", Version: "1.0.0"},
			ProjectRoot:          "file:///project",
			TextDocumentEncoding: scip.TextEncoding_UTF8,
		},
		Documents: []*scip.Document{
			{
				RelativePath:     "example.go",
				Language:         "go",
				Text:             "package example\n\ntype MyClass struct {}\n\nfunc (c *MyClass) methodA() {\n\ttargetFunc()\n}\n\nfunc regularFunc() {\n\ttargetFunc()\n}\n\nfunc targetFunc() {\n\t// Target function that's called by others\n}\n",
				PositionEncoding: scip.PositionEncoding_UTF8CodeUnitOffsetFromLineStart,
				Occurrences: []*scip.Occurrence{
					// Package definition
					{
						Range:          []int32{0, 8, 0, 15},
						Symbol:         "go package example",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{0, 0, 15, 1},
					},
					// Class definition
					{
						Range:          []int32{2, 5, 2, 12},
						Symbol:         "go package example/MyClass#",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{2, 0, 2, 22},
					},
					// Method definition
					{
						Range:          []int32{4, 9, 4, 16},
						Symbol:         "go package example/MyClass#methodA().",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{4, 0, 6, 1},
					},
					// Method call to targetFunc
					{
						Range:       []int32{5, 1, 5, 11},
						Symbol:      "go package example/targetFunc().",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
					// Regular function definition
					{
						Range:          []int32{8, 5, 8, 16},
						Symbol:         "go package example/regularFunc().",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{8, 0, 10, 1},
					},
					// Regular function call to targetFunc
					{
						Range:       []int32{9, 1, 9, 11},
						Symbol:      "go package example/targetFunc().",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
					// Target function definition
					{
						Range:          []int32{12, 5, 12, 15},
						Symbol:         "go package example/targetFunc().",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{12, 0, 14, 1},
					},
				},
				Symbols: []*scip.SymbolInformation{
					{
						Symbol:        "go package example",
						DisplayName:   "example",
						Documentation: []string{"Example package"},
						Kind:          scip.SymbolInformation_Package,
					},
					{
						Symbol:        "go package example/MyClass#",
						DisplayName:   "MyClass",
						Documentation: []string{"A class for testing"},
						Kind:          scip.SymbolInformation_Class,
					},
					{
						Symbol:        "go package example/MyClass#methodA().",
						DisplayName:   "methodA",
						Documentation: []string{"A method that calls targetFunc"},
						Kind:          scip.SymbolInformation_Method,
					},
					{
						Symbol:        "go package example/regularFunc().",
						DisplayName:   "regularFunc",
						Documentation: []string{"A regular function that calls targetFunc"},
						Kind:          scip.SymbolInformation_Function,
					},
					{
						Symbol:        "go package example/targetFunc().",
						DisplayName:   "targetFunc",
						Documentation: []string{"The target function that's called by others"},
						Kind:          scip.SymbolInformation_Function,
					},
				},
			},
		},
	}
}

func createQueryTestIndex() *scip.Index {
	return &scip.Index{
		Metadata: &scip.Metadata{
			Version:              0,
			ToolInfo:             &scip.ToolInfo{Name: "test-indexer", Version: "1.0.0"},
			ProjectRoot:          "file:///project",
			TextDocumentEncoding: scip.TextEncoding_UTF8,
		},
		Documents: []*scip.Document{
			{
				RelativePath:     "src/main.go",
				Language:         "go",
				Text:             "package main\n\nfunc foo() string {\n\treturn \"hello\"\n}\n\nfunc bar() string {\n\treturn foo() + \" world\"\n}\n\nfunc baz() string {\n\treturn bar() + \"!\"\n}\n\nfunc main() {\n\tr := baz()\n\tfmt.Println(r)\n}\n",
				PositionEncoding: scip.PositionEncoding_UTF8CodeUnitOffsetFromLineStart,
				Occurrences: []*scip.Occurrence{
					{
						Range:          []int32{0, 8, 0, 12},
						Symbol:         "go package main",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{0, 0, 18, 0},
					},
					{
						Range:          []int32{2, 5, 2, 8},
						Symbol:         "go package main/foo().",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{2, 0, 4, 1},
					},
					{
						Range:          []int32{6, 5, 6, 8},
						Symbol:         "go package main/bar().",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{6, 0, 8, 1},
					},
					{
						Range:       []int32{7, 8, 7, 11},
						Symbol:      "go package main/foo().",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
					{
						Range:          []int32{10, 5, 10, 8},
						Symbol:         "go package main/baz().",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{10, 0, 12, 1},
					},
					{
						Range:       []int32{11, 8, 11, 11},
						Symbol:      "go package main/bar().",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
					{
						Range:          []int32{14, 5, 14, 9},
						Symbol:         "go package main/main().",
						SymbolRoles:    int32(scip.SymbolRole_Definition),
						EnclosingRange: []int32{14, 0, 17, 1},
					},
					{
						Range:       []int32{15, 6, 15, 9},
						Symbol:      "go package main/baz().",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
					{
						Range:       []int32{16, 1, 16, 4},
						Symbol:      "go . fmt",
						SymbolRoles: int32(scip.SymbolRole_Import | scip.SymbolRole_ReadAccess),
					},
					{
						Range:       []int32{16, 5, 16, 12},
						Symbol:      "go . fmt/Println().",
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
				},
				Symbols: []*scip.SymbolInformation{
					{
						Symbol:        "go package main",
						DisplayName:   "main",
						Documentation: []string{"Main package"},
						Kind:          scip.SymbolInformation_Package,
					},
					{
						Symbol:        "go package main/foo().",
						DisplayName:   "foo",
						Documentation: []string{"Returns a greeting string"},
						Kind:          scip.SymbolInformation_Function,
					},
					{
						Symbol:        "go package main/bar().",
						DisplayName:   "bar",
						Documentation: []string{"Returns a greeting with world"},
						Kind:          scip.SymbolInformation_Function,
					},
					{
						Symbol:        "go package main/baz().",
						DisplayName:   "baz",
						Documentation: []string{"Returns an enthusiastic greeting"},
						Kind:          scip.SymbolInformation_Function,
					},
					{
						Symbol:        "go package main/main().",
						DisplayName:   "main",
						Documentation: []string{"Main function"},
						Kind:          scip.SymbolInformation_Function,
					},
				},
			},
		},
		ExternalSymbols: []*scip.SymbolInformation{
			{
				Symbol:        "go . fmt",
				DisplayName:   "fmt",
				Documentation: []string{"Formatting package"},
				Kind:          scip.SymbolInformation_Package,
			},
			{
				Symbol:        "go . fmt/Println().",
				DisplayName:   "Println",
				Documentation: []string{"Print to standard output"},
				Kind:          scip.SymbolInformation_Function,
			},
		},
	}
}
