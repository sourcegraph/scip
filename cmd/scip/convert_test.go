package main

import (
	"fmt"
	"io"
	"os"
	"path/filepath"
	"testing"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"google.golang.org/protobuf/proto"
	"zombiezen.com/go/sqlite"
	"zombiezen.com/go/sqlite/sqlitex"
)

func TestConvert(t *testing.T) {
	// Create a temporary directory for the test
	tmpDir, err := os.MkdirTemp("", "scip-convert-test")
	if err != nil {
		t.Fatalf("Failed to create temp directory: %v", err)
	}
	defer os.RemoveAll(tmpDir)

	// Create a test SCIP index
	testIndex := createTestIndex()
	indexPath := filepath.Join(tmpDir, "index.scip")
	writeTestIndex(t, testIndex, indexPath)

	// Output SQLite database path
	dbPath := filepath.Join(tmpDir, "output.db")

	// Run the convert command
	err = convertMain(indexPath, dbPath, 100, io.Discard)
	if err != nil {
		t.Fatalf("Convert command failed: %v", err)
	}

	// Verify the database was created
	if _, err := os.Stat(dbPath); os.IsNotExist(err) {
		t.Fatalf("Database file was not created at %s", dbPath)
	}

	// Open the database and verify contents
	db, err := sqlite.OpenConn(dbPath, sqlite.OpenReadOnly)
	if err != nil {
		t.Fatalf("Failed to open database: %v", err)
	}
	defer db.Close()

	// Test document count
	var docCount int64
	err = sqlitex.Execute(db, "SELECT COUNT(*) FROM documents", &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			docCount = stmt.ColumnInt64(0)
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to count documents: %v", err)
	}
	if int(docCount) != len(testIndex.Documents) {
		t.Errorf("Expected %d documents, got %d", len(testIndex.Documents), docCount)
	}

	// Test first document path
	var path string
	err = sqlitex.Execute(db, "SELECT relative_path FROM documents LIMIT 1", &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			path = stmt.ColumnText(0)
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to get document path: %v", err)
	}
	if path != testIndex.Documents[0].RelativePath {
		t.Errorf("Expected path %s, got %s", testIndex.Documents[0].RelativePath, path)
	}

	// Test symbol count
	var symbolCount int64
	err = sqlitex.Execute(db, "SELECT COUNT(*) FROM symbols", &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			symbolCount = stmt.ColumnInt64(0)
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to count symbols: %v", err)
	}

	// Calculate expected symbol count (just document symbols)
	expectedSymbolCount := 0
	for _, doc := range testIndex.Documents {
		expectedSymbolCount += len(doc.Symbols)
	}
	// We don't process external symbols

	// Note: Additional symbols might be created for mentions, so we just verify we have at least
	// the expected number of symbols from documents
	if int(symbolCount) < expectedSymbolCount {
		t.Errorf("Expected at least %d symbols, got %d", expectedSymbolCount, symbolCount)
	}

	// Test mentions table
	var mentionCount int64
	err = sqlitex.Execute(db, "SELECT COUNT(*) FROM mentions", &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			mentionCount = stmt.ColumnInt64(0)
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to count mentions: %v", err)
	}

	// We should have at least one mention for each symbol in occurrences
	if mentionCount == 0 {
		t.Errorf("Expected some mentions, got none")
	}

	// Test a specific mention
	var foundMention bool
	var mentionRole int64

	err = sqlitex.Execute(db, "SELECT s.symbol, m.role FROM mentions m JOIN symbols s ON m.symbol_id = s.id LIMIT 1", &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			foundMention = true
			// We don't need to use the symbol name, just verify it exists
			_ = stmt.ColumnText(0)
			mentionRole = stmt.ColumnInt64(1)
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to query mentions: %v", err)
	}

	if foundMention {
		// Verify the role is a valid value
		if mentionRole <= 0 {
			t.Errorf("Invalid symbol role: %d", mentionRole)
		}
	} else {
		t.Errorf("No mentions found")
	}

	// Test chunks and retrieval of occurrences
	var docID int64
	err = sqlitex.Execute(db, "SELECT id FROM documents LIMIT 1", &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			docID = stmt.ColumnInt64(0)
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to get document ID: %v", err)
	}

	// Query for chunks and count occurrences
	totalOccurrences := 0
	var occurrencesCount int

	// Query for occurrences using a prepared statement
	err = sqlitex.Execute(db, fmt.Sprintf("SELECT occurrences FROM chunks WHERE document_id = %d", docID), &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			// Get blob data - read the entire blob since it's only valid for the duration of this call
			reader := stmt.ColumnReader(0)
			occurrencesBlob, err := io.ReadAll(reader)
			if err != nil {
				return err
			}

			// Deserialize occurrences
			doc := &scip.Document{}
			if err := proto.Unmarshal(occurrencesBlob, doc); err != nil {
				return err
			}

			totalOccurrences += len(doc.Occurrences)
			occurrencesCount++
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to query chunks: %v", err)
	}

	// Verify we found some occurrences
	if occurrencesCount == 0 {
		t.Errorf("No occurrences found")
	}

	if totalOccurrences != len(testIndex.Documents[0].Occurrences) {
		t.Errorf("Expected %d occurrences, got %d", len(testIndex.Documents[0].Occurrences), totalOccurrences)
	}
}

func TestSCIPOccurrencesVirtualTable(t *testing.T) {
	// Create a temporary directory for the test
	tmpDir, err := os.MkdirTemp("", "scip-vtable-test")
	if err != nil {
		t.Fatalf("Failed to create temp directory: %v", err)
	}
	defer os.RemoveAll(tmpDir)

	// Create a test SQLite database
	dbPath := filepath.Join(tmpDir, "test.db")
	db, err := createSQLiteDatabase(dbPath)
	if err != nil {
		t.Fatalf("Failed to create SQLite database: %v", err)
	}
	defer db.Close()

	// Create test occurrences
	occurrences := []*scip.Occurrence{
		{
			Range:       []int32{1, 0, 1, 5},
			Symbol:      "go package main/func1",
			SymbolRoles: int32(scip.SymbolRole_Definition),
		},
		{
			Range:       []int32{2, 10, 2, 15},
			Symbol:      "go package main/func2",
			SymbolRoles: int32(scip.SymbolRole_ReadAccess),
		},
	}

	// Serialize the occurrences to a protobuf blob
	occBlob, err := proto.Marshal(&scip.Document{Occurrences: occurrences})
	if err != nil {
		t.Fatalf("Failed to marshal occurrences: %v", err)
	}

	// Create a temporary table for testing
	err = sqlitex.ExecuteTransient(db, "CREATE TABLE test_occurrences (id INTEGER PRIMARY KEY, blob BLOB)", nil)
	if err != nil {
		t.Fatalf("Failed to create test table: %v", err)
	}

	// Insert the test blob
	stmt, err := db.Prepare("INSERT INTO test_occurrences (blob) VALUES (?)")
	if err != nil {
		t.Fatalf("Failed to prepare insert statement: %v", err)
	}
	stmt.BindBytes(1, occBlob)
	_, err = stmt.Step()
	if err != nil {
		stmt.Finalize()
		t.Fatalf("Failed to insert test blob: %v", err)
	}
	stmt.Finalize()

	// Query the virtual table
	type Result struct {
		Symbol      string
		StartLine   int64
		StartChar   int64
		EndLine     int64
		EndChar     int64
		SymbolRoles int64
		Role        string
	}

	results := []Result{}

	err = sqlitex.Execute(db, "SELECT symbol, startLine, startChar, endLine, endChar, roles, role FROM scip_occurrences WHERE blob = (SELECT blob FROM test_occurrences LIMIT 1) ORDER BY startLine", &sqlitex.ExecOptions{
		ResultFunc: func(stmt *sqlite.Stmt) error {
			results = append(results, Result{
				Symbol:      stmt.ColumnText(0),
				StartLine:   stmt.ColumnInt64(1),
				StartChar:   stmt.ColumnInt64(2),
				EndLine:     stmt.ColumnInt64(3),
				EndChar:     stmt.ColumnInt64(4),
				SymbolRoles: stmt.ColumnInt64(5),
				Role:        stmt.ColumnText(6),
			})
			return nil
		},
	})
	if err != nil {
		t.Fatalf("Failed to query virtual table: %v", err)
	}

	// Verify we have the expected number of rows
	if len(results) != 2 {
		t.Fatalf("Expected 2 occurrences, got %d", len(results))
	}

	// Verify the first occurrence
	expectedResults := []Result{
		{
			Symbol:      "go package main/func1",
			StartLine:   1,
			StartChar:   0,
			EndLine:     1,
			EndChar:     5,
			SymbolRoles: int64(scip.SymbolRole_Definition),
			Role:        "definition",
		},
		{
			Symbol:      "go package main/func2",
			StartLine:   2,
			StartChar:   10,
			EndLine:     2,
			EndChar:     15,
			SymbolRoles: int64(scip.SymbolRole_ReadAccess),
			Role:        "reference",
		},
	}

	for i, expected := range expectedResults {
		actual := results[i]
		if actual.Symbol != expected.Symbol {
			t.Errorf("Result %d: expected Symbol='%s', got '%s'", i, expected.Symbol, actual.Symbol)
		}
		if actual.StartLine != expected.StartLine {
			t.Errorf("Result %d: expected StartLine=%d, got %d", i, expected.StartLine, actual.StartLine)
		}
		if actual.StartChar != expected.StartChar {
			t.Errorf("Result %d: expected StartChar=%d, got %d", i, expected.StartChar, actual.StartChar)
		}
		if actual.EndLine != expected.EndLine {
			t.Errorf("Result %d: expected EndLine=%d, got %d", i, expected.EndLine, actual.EndLine)
		}
		if actual.EndChar != expected.EndChar {
			t.Errorf("Result %d: expected EndChar=%d, got %d", i, expected.EndChar, actual.EndChar)
		}
		if actual.Role != expected.Role {
			t.Errorf("Result %d: expected Role='%s', got '%s'", i, expected.Role, actual.Role)
		}
	}
}

func TestDeserializeOccurrencesFromBlob(t *testing.T) {
	// Create test occurrences
	occurrences := []*scip.Occurrence{
		{
			Range:       []int32{1, 0, 1, 5},
			Symbol:      "go package main/func1",
			SymbolRoles: int32(scip.SymbolRole_Definition),
		},
		{
			Range:       []int32{2, 10, 2, 15},
			Symbol:      "go package main/func2",
			SymbolRoles: int32(0),
		},
	}

	// Serialize the occurrences to a protobuf blob
	occBlob, err := proto.Marshal(&scip.Document{Occurrences: occurrences})
	if err != nil {
		t.Fatalf("Failed to marshal occurrences: %v", err)
	}

	// Use our utility function to deserialize the blob
	parsedOccurrences, err := DeserializeOccurrencesFromBlob(occBlob)
	if err != nil {
		t.Fatalf("Failed to deserialize occurrences: %v", err)
	}

	// Verify results
	if len(parsedOccurrences) != 2 {
		t.Errorf("Expected 2 occurrences, got %d", len(parsedOccurrences))
	}

	// Verify first occurrence
	if parsedOccurrences[0].Symbol != "go package main/func1" {
		t.Errorf("Expected symbol 'go package main/func1', got '%s'", parsedOccurrences[0].Symbol)
	}
	if parsedOccurrences[0].Role != "definition" {
		t.Errorf("Expected role 'definition', got '%s'", parsedOccurrences[0].Role)
	}
	if parsedOccurrences[0].StartLine != 1 || parsedOccurrences[0].StartChar != 0 {
		t.Errorf("Expected start position (1,0), got (%d,%d)",
			parsedOccurrences[0].StartLine, parsedOccurrences[0].StartChar)
	}
	if parsedOccurrences[0].EndLine != 1 || parsedOccurrences[0].EndChar != 5 {
		t.Errorf("Expected end position (1,5), got (%d,%d)",
			parsedOccurrences[0].EndLine, parsedOccurrences[0].EndChar)
	}

	// Verify second occurrence
	if parsedOccurrences[1].Symbol != "go package main/func2" {
		t.Errorf("Expected symbol 'go package main/func2', got '%s'", parsedOccurrences[1].Symbol)
	}
	if parsedOccurrences[1].Role != "reference" {
		t.Errorf("Expected role 'reference', got '%s'", parsedOccurrences[1].Role)
	}
	if parsedOccurrences[1].StartLine != 2 || parsedOccurrences[1].StartChar != 10 {
		t.Errorf("Expected start position (2,10), got (%d,%d)",
			parsedOccurrences[1].StartLine, parsedOccurrences[1].StartChar)
	}
	if parsedOccurrences[1].EndLine != 2 || parsedOccurrences[1].EndChar != 15 {
		t.Errorf("Expected end position (2,15), got (%d,%d)",
			parsedOccurrences[1].EndLine, parsedOccurrences[1].EndChar)
	}
}

func createTestIndex() *scip.Index {
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
				Text:             "package main\n\nfunc main() {\n\tfmt.Println(\"Hello, world!\")\n}\n",
				PositionEncoding: scip.PositionEncoding_UTF8CodeUnitOffsetFromLineStart,
				Occurrences: []*scip.Occurrence{
					{
						Range:       []int32{0, 8, 0, 12},
						Symbol:      "go package main",
						SymbolRoles: int32(scip.SymbolRole_Definition),
					},
					{
						Range:       []int32{2, 5, 2, 9},
						Symbol:      "go package main/main().",
						SymbolRoles: int32(scip.SymbolRole_Definition),
					},
					{
						Range:       []int32{3, 1, 3, 4},
						Symbol:      "go . fmt",
						SymbolRoles: int32(scip.SymbolRole_Import | scip.SymbolRole_ReadAccess),
					},
					{
						Range:       []int32{3, 5, 3, 12},
						Symbol:      "go . fmt/Println().",
						SymbolRoles: int32(0),
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

func writeTestIndex(t *testing.T, index *scip.Index, path string) {
	indexBytes, err := proto.Marshal(index)
	if err != nil {
		t.Fatalf("Failed to marshal test index: %v", err)
	}

	if err := os.WriteFile(path, indexBytes, 0644); err != nil {
		t.Fatalf("Failed to write test index: %v", err)
	}
}
