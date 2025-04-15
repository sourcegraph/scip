package main

import (
	"github.com/cockroachdb/errors"
	"zombiezen.com/go/sqlite"
	"zombiezen.com/go/sqlite/sqlitex"
)

// findReferencesLocations finds all references to a symbol
func findReferencesLocations(db *sqlite.Conn, symbol string) ([]Location, error) {
	// Use our existing function to find all occurrences
	references, err := findSymbolOccurrences(db, symbol, false)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to find occurrences of %s", symbol)
	}

	// Filter to include only references (non-definitions)
	var result []Location
	for _, ref := range references {
		if ref.Role != "definition" {
			result = append(result, ref)
		}
	}

	return result, nil
}

// findEnclosingDefinitions finds definitions that enclose a reference
func findEnclosingDefinitions(db *sqlite.Conn, reference Location) ([]Location, error) {
	// First, get the document ID
	var documentID int64
	found := false

	err := sqlitex.Execute(db, "SELECT id FROM documents WHERE relative_path = ?", &sqlitex.ExecOptions{
		Args: []interface{}{reference.Path},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			documentID = stmt.ColumnInt64(0)
			found = true
			return nil
		},
	})

	if err != nil || !found {
		return nil, errors.Wrapf(err, "failed to find document ID for path %s", reference.Path)
	}

	// Find definitions that contain this line
	var results []Location

	query := `
		SELECT d.start_line, d.start_char, d.end_line, d.end_char, s.symbol 
		FROM defn_trees d
		JOIN symbols s ON d.symbol_id = s.id
		WHERE d.document_id = ?
		  AND d.start_line <= ?
		  AND d.end_line >= ?
		  AND s.symbol != ? -- Exclude the reference itself
		ORDER BY (d.end_line - d.start_line) ASC
	`

	err = sqlitex.Execute(db, query, &sqlitex.ExecOptions{
		Args: []interface{}{documentID, reference.Line, reference.Line, reference.Symbol},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			loc := Location{
				Path:      reference.Path,
				Line:      int(stmt.ColumnInt64(0)),
				Character: int(stmt.ColumnInt64(1)),
				EndLine:   int(stmt.ColumnInt64(2)),
				EndChar:   int(stmt.ColumnInt64(3)),
				Symbol:    stmt.ColumnText(4),
				Role:      "definition",
			}
			results = append(results, loc)
			return nil
		},
	})

	if err != nil {
		return nil, errors.Wrap(err, "failed to query defn_trees")
	}

	return results, nil
}