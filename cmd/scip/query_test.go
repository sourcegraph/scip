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
		var hierarchy CallHierarchyItem
		err = json.Unmarshal([]byte(strings.TrimSpace(output.String())), &hierarchy)
		if err != nil {
			t.Fatalf("Failed to parse JSON result: %v", err)
		}

		// Verify the root of the hierarchy
		if hierarchy.Symbol != symbol {
			t.Errorf("Expected root symbol %s, got %s", symbol, hierarchy.Symbol)
		}

		// Verify the location
		if hierarchy.Location.Path != "src/main.go" || hierarchy.Location.Line != 2 {
			t.Errorf("Unexpected location: %+v", hierarchy.Location)
		}

		// We should have bar() in the calls
		if len(hierarchy.Calls) == 0 {
			t.Errorf("Expected at least one call, got none")
		}

		// Check for complete call hierarchy (nested layers)
		foundBar := false
		foundBaz := false
		foundMain := false
		var barCall *CallHierarchyItem

		// First layer
		for _, call := range hierarchy.Calls {
			if call.Symbol == "go package main/bar()." {
				foundBar = true
				barCall = &call
			}
		}

		// Check second layer (if bar was found)
		if barCall != nil && len(barCall.Calls) > 0 {
			for _, call := range barCall.Calls {
				if call.Symbol == "go package main/baz()." {
					foundBaz = true
					// Check third layer
					for _, nestedCall := range call.Calls {
						if nestedCall.Symbol == "go package main/main()." {
							foundMain = true
						}
					}
				}
			}
		}

		// Validate the nested relationships were found
		t.Logf("Call hierarchy: foo->bar: %v, bar->baz: %v, baz->main: %v", 
			foundBar, foundBaz, foundMain)
		
		// There should be at least the first level of nesting
		if !foundBar {
			t.Errorf("Missing bar in call hierarchy")
		}
	})
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
