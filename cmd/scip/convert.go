package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"sort"

	"github.com/cockroachdb/errors"
	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/urfave/cli/v2"
	"google.golang.org/protobuf/proto"
	"zombiezen.com/go/sqlite"
	"zombiezen.com/go/sqlite/sqlitex"
)

const (
	ChunkSize = 100 // Number of occurrences per chunk
)

func convertCommand() cli.Command {
	var indexPath, outputPath string
	var chunkSize int

	command := cli.Command{
		Name:  "convert",
		Usage: "Convert a SCIP index to SQLite database",
		Description: `Converts a SCIP index to a SQLite database with optimized settings.

The SQLite database contains four tables:
1. documents: Contains metadata about source files
2. chunks: Stores occurrences in chunks of approximately 100 occurrences per chunk
3. symbols: Stores symbol information with unique IDs
4. mentions: Tracks which chunks contain which symbols with specific roles`,
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "output",
				Usage:       "Path to output SQLite database file",
				Destination: &outputPath,
				Value:       "index.db",
			},
			&cli.IntFlag{
				Name:        "chunk-size",
				Usage:       "Number of occurrences per chunk",
				Destination: &chunkSize,
				Value:       ChunkSize,
			},
		},
		Action: func(c *cli.Context) error {
			indexPath = c.Args().Get(0)
			if indexPath == "" {
				return errors.New("missing argument for path to SCIP index")
			}

			if chunkSize <= 0 {
				return errors.New("chunk-size must be a positive integer")
			}

			return convertMain(indexPath, outputPath, chunkSize, c.App.Writer)
		},
	}
	return command
}

func convertMain(indexPath string, outputPath string, chunkSize int, out io.Writer) error {
	index, err := readFromOption(indexPath)
	if err != nil {
		return err
	}

	// Create the output directory if it doesn't exist
	outputDir := filepath.Dir(outputPath)
	if outputDir != "." {
		if err := os.MkdirAll(outputDir, 0755); err != nil {
			return errors.Wrapf(err, "failed to create output directory %s", outputDir)
		}
	}

	// Create and set up the SQLite database
	db, err := createSQLiteDatabase(outputPath)
	if err != nil {
		return err
	}
	defer db.Close()

	// Convert the SCIP index to the SQLite database
	converter := NewConverter(db, chunkSize)
	if err := converter.Convert(index); err != nil {
		return err
	}

	fmt.Fprintf(out, "Successfully converted SCIP index to SQLite database at %s\n", outputPath)
	return nil
}

func createSQLiteDatabase(path string) (*sqlite.Conn, error) {
	// Open a new SQLite database connection
	conn, err := sqlite.OpenConn(path, sqlite.OpenCreate|sqlite.OpenReadWrite|sqlite.OpenWAL)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to open SQLite database at %s", path)
	}

	// Apply optimized settings
	err = sqlitex.ExecuteTransient(conn, `PRAGMA synchronous = normal;`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to set synchronous mode")
	}

	err = sqlitex.ExecuteTransient(conn, `PRAGMA temp_store = memory;`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to set temp_store")
	}

	// Enable strict mode and foreign key constraints
	err = sqlitex.ExecuteTransient(conn, `PRAGMA strict = ON;`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to enable strict mode")
	}

	err = sqlitex.ExecuteTransient(conn, `PRAGMA foreign_keys = ON;`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to enable foreign key constraints")
	}

	// Create tables in a transaction
	err = sqlitex.Execute(conn, "BEGIN TRANSACTION", nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to begin transaction")
	}

	// Create tables
	err = sqlitex.ExecuteTransient(conn, `CREATE TABLE documents (
		id INTEGER PRIMARY KEY,
		language TEXT NOT NULL,
		relative_path TEXT NOT NULL,
		position_encoding INTEGER NOT NULL,
		text TEXT
	)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create documents table")
	}

	err = sqlitex.ExecuteTransient(conn, `CREATE TABLE chunks (
		id INTEGER PRIMARY KEY,
		document_id INTEGER NOT NULL,
		chunk_index INTEGER NOT NULL,
		start_line INTEGER NOT NULL,
		end_line INTEGER NOT NULL,
		occurrences BLOB NOT NULL,
		FOREIGN KEY (document_id) REFERENCES documents(id)
	)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create chunks table")
	}

	err = sqlitex.ExecuteTransient(conn, `CREATE TABLE symbols (
		id INTEGER PRIMARY KEY,
		symbol TEXT NOT NULL UNIQUE,
		display_name TEXT,
		kind INTEGER,
		documentation TEXT,
		signature BLOB,
		enclosing_symbol TEXT,
		relationships BLOB
	)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create symbols table")
	}

	err = sqlitex.ExecuteTransient(conn, `CREATE TABLE mentions (
		chunk_id INTEGER NOT NULL,
		symbol_id INTEGER NOT NULL,
		role INTEGER NOT NULL,
		PRIMARY KEY (chunk_id, symbol_id, role),
		FOREIGN KEY (chunk_id) REFERENCES chunks(id),
		FOREIGN KEY (symbol_id) REFERENCES symbols(id)
	)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create mentions table")
	}

	// Create indexes
	err = sqlitex.ExecuteTransient(conn, `CREATE INDEX idx_documents_path ON documents(relative_path)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create index")
	}

	err = sqlitex.ExecuteTransient(conn, `CREATE INDEX idx_chunks_doc_id ON chunks(document_id)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create index")
	}

	err = sqlitex.ExecuteTransient(conn, `CREATE INDEX idx_chunks_line_range ON chunks(document_id, start_line, end_line)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create index")
	}

	err = sqlitex.ExecuteTransient(conn, `CREATE INDEX idx_symbols_symbol ON symbols(symbol)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create index")
	}

	err = sqlitex.ExecuteTransient(conn, `CREATE INDEX idx_mentions_symbol_id ON mentions(symbol_id)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create index")
	}

	err = sqlitex.ExecuteTransient(conn, `CREATE INDEX idx_mentions_role ON mentions(symbol_id, role)`, nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to create index")
	}

	// Commit the transaction
	err = sqlitex.ExecuteTransient(conn, "COMMIT", nil)
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to commit transaction")
	}

	return conn, nil
}

// Converter handles the conversion from SCIP to SQLite
type Converter struct {
	conn      *sqlite.Conn
	chunkSize int
}

// NewConverter creates a new converter instance
func NewConverter(conn *sqlite.Conn, chunkSize int) *Converter {
	return &Converter{
		conn:      conn,
		chunkSize: chunkSize,
	}
}

// Convert processes the SCIP index and writes it to the SQLite database
func (c *Converter) Convert(index *scip.Index) error {
	var insertErr error
	// Execute everything in a transaction
	err := sqlitex.Execute(c.conn, "BEGIN TRANSACTION", nil)
	if err != nil {
		return errors.Wrap(err, "failed to begin transaction")
	}
	
	defer func() {
		if r := recover(); r != nil {
			// Rollback on panic
			rberr := sqlitex.Execute(c.conn, "ROLLBACK", nil)
			if rberr != nil {
				// Just log the rollback error
				fmt.Fprintf(os.Stderr, "Error rolling back transaction: %v\n", rberr)
			}
			// Re-panic
			panic(r)
		} else if insertErr != nil {
			// Rollback on error
			rberr := sqlitex.Execute(c.conn, "ROLLBACK", nil)
			if rberr != nil {
				// Just log the rollback error, but keep the original error
				fmt.Fprintf(os.Stderr, "Error rolling back transaction: %v\n", rberr)
			}
		}
	}()

	// Process documents
	for _, doc := range index.Documents {
		// Sort all occurrences in the document for consistent storage
		sortOccurrences(doc.Occurrences)

		// Insert document
		docStmt, err := c.conn.Prepare("INSERT INTO documents (language, relative_path, position_encoding, text) VALUES (?, ?, ?, ?)")
		if err != nil {
			return errors.Wrap(err, "failed to prepare document statement")
		}
		// We'll finalize manually after use

		// Bind parameters and execute
		docStmt.BindText(1, doc.Language)
		docStmt.BindText(2, doc.RelativePath)
		docStmt.BindInt64(3, int64(doc.PositionEncoding))
		if doc.Text != "" {
			docStmt.BindText(4, doc.Text)
		} else {
			docStmt.BindNull(4)
		}

		// Execute the statement
		_, err = docStmt.Step()
		if err != nil {
			docStmt.Finalize() // Clean up on error
			return errors.Wrapf(err, "failed to insert document %s", doc.RelativePath)
		}
		
		// Cleanup
		docStmt.Finalize()

		// Get the last inserted row ID (document ID)
		docID := c.conn.LastInsertRowID()

		// Process symbols
		for _, symbol := range doc.Symbols {
			signatureBlob, err := convertDocumentToBlob(symbol.SignatureDocumentation)
			if err != nil {
				return errors.Wrapf(err, "failed to convert signature for symbol %s", symbol.Symbol)
			}

			relationshipsBlob, err := convertRelationshipsToBlob(symbol.Relationships)
			if err != nil {
				return errors.Wrapf(err, "failed to convert relationships for symbol %s", symbol.Symbol)
			}

			documentation := ""
			if len(symbol.Documentation) > 0 {
				documentation = symbol.Documentation[0]
				for i := 1; i < len(symbol.Documentation); i++ {
					documentation += "\n" + symbol.Documentation[i]
				}
			}

			// Look up the symbol first
			lookupStmt, err := c.conn.Prepare("SELECT id FROM symbols WHERE symbol = ?")
			if err != nil {
				return errors.Wrap(err, "failed to prepare symbol lookup statement")
			}

			// Bind parameters
			lookupStmt.BindText(1, symbol.Symbol)

			// Execute and get result
			found := false
			hasRow, err := lookupStmt.Step()
			if err != nil {
				lookupStmt.Finalize() // Clean up on error
				return errors.Wrap(err, "failed to execute symbol lookup")
			}

			if hasRow {
				// Symbol exists, just mark as found (we don't need the ID for document symbols)
				found = true
			}
			lookupStmt.Finalize()

			if !found {
				// Symbol doesn't exist, insert it
				insertStmt, err := c.conn.Prepare("INSERT OR IGNORE INTO symbols (symbol, display_name, kind, documentation, signature, enclosing_symbol, relationships) VALUES (?, ?, ?, ?, ?, ?, ?)")
				if err != nil {
					return errors.Wrap(err, "failed to prepare symbol insert statement")
				}

				// Bind parameters
				insertStmt.BindText(1, symbol.Symbol)
				if symbol.DisplayName != "" {
					insertStmt.BindText(2, symbol.DisplayName)
				} else {
					insertStmt.BindNull(2)
				}
				insertStmt.BindInt64(3, int64(symbol.Kind))
				if documentation != "" {
					insertStmt.BindText(4, documentation)
				} else {
					insertStmt.BindNull(4)
				}
				if signatureBlob != nil {
					insertStmt.BindBytes(5, signatureBlob)
				} else {
					insertStmt.BindNull(5)
				}
				if symbol.EnclosingSymbol != "" {
					insertStmt.BindText(6, symbol.EnclosingSymbol)
				} else {
					insertStmt.BindNull(6)
				}
				if relationshipsBlob != nil {
					insertStmt.BindBytes(7, relationshipsBlob)
				} else {
					insertStmt.BindNull(7)
				}

				// Execute
				_, err = insertStmt.Step()
				if err != nil {
					insertStmt.Finalize() // Clean up on error
					return errors.Wrapf(err, "failed to insert symbol %s", symbol.Symbol)
				}
				insertStmt.Finalize()

				// Look up the ID of the newly inserted symbol
				lookupStmt, err = c.conn.Prepare("SELECT id FROM symbols WHERE symbol = ?")
				if err != nil {
					return errors.Wrap(err, "failed to prepare symbol lookup statement")
				}
				lookupStmt.BindText(1, symbol.Symbol)
				hasRow, err := lookupStmt.Step()
				if err != nil || !hasRow {
					lookupStmt.Finalize() // Clean up on error
					return errors.Wrapf(err, "failed to look up newly inserted symbol %s", symbol.Symbol)
				}
				// We don't need the ID for document symbols
				lookupStmt.Finalize()
			}
		}

		// Process occurrences in chunks (already sorted at document level)
		chunkedOccurrences := chunkOccurrences(doc.Occurrences, c.chunkSize)
		for i, chunk := range chunkedOccurrences {
			if len(chunk) == 0 {
				continue
			}

			// Find min and max line numbers in this chunk
			startLine, endLine := findLineRange(chunk)
			
			// Serialize occurrences
			occurrencesBlob, err := proto.Marshal(&scip.Document{
				Occurrences: chunk,
			})
			if err != nil {
				return errors.Wrap(err, "failed to serialize occurrences")
			}

			// Insert chunk
			chunkStmt, err := c.conn.Prepare("INSERT INTO chunks (document_id, chunk_index, start_line, end_line, occurrences) VALUES (?, ?, ?, ?, ?)")
			if err != nil {
			return errors.Wrap(err, "failed to prepare chunk statement")
			}

			// Bind parameters
			chunkStmt.BindInt64(1, docID)
			chunkStmt.BindInt64(2, int64(i))
			chunkStmt.BindInt64(3, int64(startLine))
			chunkStmt.BindInt64(4, int64(endLine))
			chunkStmt.BindBytes(5, occurrencesBlob)

			// Execute
			_, err = chunkStmt.Step()
			if err != nil {
				chunkStmt.Finalize() // Clean up on error
				return errors.Wrap(err, "failed to insert chunk")
			}
			chunkStmt.Finalize()

			// Get the last inserted chunk ID
			chunkID := c.conn.LastInsertRowID()

			// Add entries to the mentions table for each unique symbol in this chunk
			symbolRoles := make(map[string]int32)
			for _, occ := range chunk {
				if occ.Symbol != "" {
					// If we have multiple occurrences of the same symbol with different roles,
					// combine the roles (bitwise OR)
					symbolRoles[occ.Symbol] |= occ.SymbolRoles
				}
			}

			// Prepare statements for mentions
			mentionStmt, err := c.conn.Prepare("INSERT OR IGNORE INTO mentions (chunk_id, symbol_id, role) VALUES (?, ?, ?)")
			if err != nil {
			return errors.Wrap(err, "failed to prepare mention statement")
			}

			symLookupStmt, err := c.conn.Prepare("SELECT id FROM symbols WHERE symbol = ?")
			if err != nil {
			mentionStmt.Finalize() // Clean up previous statement
			return errors.Wrap(err, "failed to prepare symbol lookup statement for mentions")
			}

			symInsertStmt, err := c.conn.Prepare("INSERT OR IGNORE INTO symbols (symbol, display_name, kind, documentation, signature, enclosing_symbol, relationships) VALUES (?, ?, ?, ?, ?, ?, ?)")
			if err != nil {
			mentionStmt.Finalize() // Clean up previous statements
			symLookupStmt.Finalize()
			return errors.Wrap(err, "failed to prepare symbol insert statement for mentions")
			}

			// Add mentions for each symbol in this chunk
			for symbolName, role := range symbolRoles {
				// Look up the symbol ID
				var symbolID int64
				
				// Bind parameters for lookup
				symLookupStmt.BindText(1, symbolName)
				
				// Execute lookup
				hasRow, err := symLookupStmt.Step()
				if err != nil {
					return errors.Wrap(err, "failed to execute symbol lookup for mention")
				}

				if hasRow {
					// Found the symbol, get its ID
					symbolID = symLookupStmt.ColumnInt64(0)
				} else {
					// Symbol doesn't exist yet, create it with minimal information
					symInsertStmt.Reset()
					symInsertStmt.BindText(1, symbolName)
					symInsertStmt.BindNull(2) // display_name
					symInsertStmt.BindInt64(3, 0) // kind
					symInsertStmt.BindNull(4) // documentation
					symInsertStmt.BindNull(5) // signature
					symInsertStmt.BindNull(6) // enclosing_symbol
					symInsertStmt.BindNull(7) // relationships

					// Execute insert
					_, err = symInsertStmt.Step()
					if err != nil {
						return errors.Wrapf(err, "failed to insert symbol %s for mention", symbolName)
					}

					// Look up the newly inserted symbol
					symLookupStmt.Reset()
					symLookupStmt.BindText(1, symbolName)
					
					hasRow, err = symLookupStmt.Step()
					if err != nil || !hasRow {
						return errors.Wrapf(err, "failed to look up newly inserted symbol %s for mention", symbolName)
					}
					symbolID = symLookupStmt.ColumnInt64(0)
				}
				symLookupStmt.Reset()

				// Insert mention
				mentionStmt.Reset()
				mentionStmt.BindInt64(1, chunkID)
				mentionStmt.BindInt64(2, symbolID)
				mentionStmt.BindInt64(3, int64(role))

				_, err = mentionStmt.Step()
				if err != nil {
					return errors.Wrapf(err, "failed to insert mention for symbol %s", symbolName)
				}
			}
		}
	}

	// We intentionally don't process external symbols

	// Commit the transaction
	err = sqlitex.Execute(c.conn, "COMMIT", nil)
	if err != nil {
		// Try to rollback, but keep the original error
		rberr := sqlitex.Execute(c.conn, "ROLLBACK", nil) 
		if rberr != nil {
			// Just log the rollback error
			fmt.Fprintf(os.Stderr, "Error rolling back transaction: %v\n", rberr)
		}
		return errors.Wrap(err, "failed to commit transaction")
	}

	return nil
}

// chunkOccurrences splits occurrences into chunks of the specified size
func chunkOccurrences(occurrences []*scip.Occurrence, chunkSize int) [][]*scip.Occurrence {
	if len(occurrences) == 0 {
		return nil
	}

	chunks := make([][]*scip.Occurrence, 0, (len(occurrences)+chunkSize-1)/chunkSize)
	for i := 0; i < len(occurrences); i += chunkSize {
		end := i + chunkSize
		if end > len(occurrences) {
			end = len(occurrences)
		}
		chunks = append(chunks, occurrences[i:end])
	}

	return chunks
}

// findLineRange determines the min and max line numbers in a set of occurrences
func findLineRange(occurrences []*scip.Occurrence) (int, int) {
	if len(occurrences) == 0 {
		return 0, 0
	}

	minLine := int(occurrences[0].Range[0])
	maxLine := int(occurrences[0].Range[0])

	for _, occ := range occurrences {
		startLine := int(occ.Range[0])
		if startLine < minLine {
			minLine = startLine
		}

		// If range has 4 elements, endLine is at index 2
		// If range has 3 elements, endLine is the same as startLine
		endLine := startLine
		if len(occ.Range) >= 4 {
			endLine = int(occ.Range[2])
		}

		if endLine > maxLine {
			maxLine = endLine
		}
	}

	return minLine, maxLine
}

// convertDocumentToBlob serializes a Document to bytes for storage
func convertDocumentToBlob(doc *scip.Document) ([]byte, error) {
	if doc == nil {
		return nil, nil
	}
	return proto.Marshal(doc)
}

// convertRelationshipsToBlob serializes relationships to bytes for storage
func convertRelationshipsToBlob(relationships []*scip.Relationship) ([]byte, error) {
	if len(relationships) == 0 {
		return nil, nil
	}

	return json.Marshal(relationships)
}

// sortOccurrences sorts occurrences for consistent storage
func sortOccurrences(occurrences []*scip.Occurrence) {
	// If we have no occurrences or just one, no need to sort
	if len(occurrences) <= 1 {
		return
	}

	sort.Slice(occurrences, func(i, j int) bool {
		// First sort by line
		if occurrences[i].Range[0] != occurrences[j].Range[0] {
			return occurrences[i].Range[0] < occurrences[j].Range[0]
		}
		
		// Then by column
		if occurrences[i].Range[1] != occurrences[j].Range[1] {
			return occurrences[i].Range[1] < occurrences[j].Range[1]
		}
		
		// Then by symbol name
		if occurrences[i].Symbol != occurrences[j].Symbol {
			return occurrences[i].Symbol < occurrences[j].Symbol
		}
		
		// Then by symbol roles
		return occurrences[i].SymbolRoles < occurrences[j].SymbolRoles
	})
}