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
				RelativePath:    "src/main.go",
				Language:        "go",
				Text:            "package main\n\nfunc main() {\n\tfmt.Println(\"Hello, world!\")\n}\n",
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
						SymbolRoles: int32(scip.SymbolRole_ReadAccess),
					},
				},
				Symbols: []*scip.SymbolInformation{
					{
						Symbol:      "go package main",
						DisplayName: "main",
						Documentation: []string{"Main package"},
						Kind:          scip.SymbolInformation_Package,
					},
					{
						Symbol:      "go package main/main().",
						DisplayName: "main",
						Documentation: []string{"Main function"},
						Kind:          scip.SymbolInformation_Function,
					},
				},
			},
		},
		ExternalSymbols: []*scip.SymbolInformation{
			{
				Symbol:      "go . fmt",
				DisplayName: "fmt",
				Documentation: []string{"Formatting package"},
				Kind:          scip.SymbolInformation_Package,
			},
			{
				Symbol:      "go . fmt/Println().",
				DisplayName: "Println",
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