package main

import (
	"encoding/json"
	"fmt"
	"io"
	"os"
	"strings"

	"github.com/cockroachdb/errors"
	"github.com/urfave/cli/v2"
	"zombiezen.com/go/sqlite"
	"zombiezen.com/go/sqlite/sqlitex"
)

func queryCommand() cli.Command {
	var dbPath string

	command := cli.Command{
		Name:        "query",
		Usage:       "Query a SCIP SQLite database",
		Description: `Performs queries against a SQLite database created with the 'convert' command.`,
		Flags: []cli.Flag{
			&cli.StringFlag{
				Name:        "db-path",
				Usage:       "Path to SQLite database",
				Destination: &dbPath,
				Required:    true,
			},
		},
		Before: func(c *cli.Context) error {
			// Check if the database exists
			if _, err := os.Stat(dbPath); os.IsNotExist(err) {
				return errors.Errorf("database file does not exist: %s", dbPath)
			}

			return nil
		},
		Subcommands: []*cli.Command{
			{
				Name:  "goto-definition",
				Usage: "Find the definition location for a symbol",
				Flags: []cli.Flag{
					&cli.StringFlag{
						Name:     "symbol",
						Usage:    "Symbol to look up",
						Required: true,
					},
				},
				Action: func(c *cli.Context) error {
					symbol := c.String("symbol")
					return gotoDefinitionQuery(dbPath, symbol, c.App.Writer)
				},
			},
			{
				Name:  "find-references",
				Usage: "Find all references to a symbol",
				Flags: []cli.Flag{
					&cli.StringFlag{
						Name:     "symbol",
						Usage:    "Symbol to find references for",
						Required: true,
					},
				},
				Action: func(c *cli.Context) error {
					symbol := c.String("symbol")
					return findReferencesQuery(dbPath, symbol, c.App.Writer)
				},
			},
			{
				Name:  "call-hierarchy",
				Usage: "Generate a call hierarchy for a symbol",
				Flags: []cli.Flag{
					&cli.StringFlag{
						Name:     "symbol",
						Usage:    "Symbol to generate call hierarchy for",
						Required: true,
					},
					&cli.IntFlag{
						Name:  "max-depth",
						Usage: "Maximum depth of the call hierarchy",
						Value: 10,
					},
				},
				Action: func(c *cli.Context) error {
					symbol := c.String("symbol")
					maxDepth := c.Int("max-depth")
					return callHierarchyQuery(dbPath, symbol, maxDepth, c.App.Writer)
				},
			},
		},
	}

	// Register the SCIP occurrences virtual table module in an action that runs
	// before any subcommands
	command.Action = func(c *cli.Context) error {
		// If no subcommands specified, print help
		return cli.ShowCommandHelp(c, "query")
	}

	return command
}

// Location represents a code location returned by queries
type Location struct {
	Path      string `json:"path"`              // File path
	Line      int    `json:"line"`              // 0-based line number
	Character int    `json:"character"`         // 0-based character offset
	EndLine   int    `json:"endLine"`           // 0-based end line
	EndChar   int    `json:"endChar"`           // 0-based end character
	Snippet   string `json:"snippet,omitempty"` // Code snippet if available
	Symbol    string `json:"-"`                 // Symbol at this location
	Role      string `json:"role"`              // Role (definition/reference)
}

// CallHierarchyItem represents a node in the call hierarchy
type CallHierarchyItem struct {
	Symbol   string              `json:"symbol"`
	Location Location            `json:"location,omitempty"`
	Callers  []CallHierarchyItem `json:"callers,omitempty"`
}

// CallSite represents a single location where one function calls another
type CallSite struct {
	RelativePath string `json:"relativePath"` // File path containing the call
	Range        Range  `json:"range"`        // Source range of the call site
}

// CallerInfo represents information about a calling function
type CallerInfo struct {
	Symbol       string `json:"symbol"`       // Symbol of the calling function
	RelativePath string `json:"relativePath"` // File path containing the caller
	Range        Range  `json:"range"`        // Source range of the caller definition
}

// Range represents a source code range
type Range struct {
	StartLine int `json:"startLine"` // Start line (0-based)
	StartChar int `json:"startChar"` // Start character (0-based)
	EndLine   int `json:"endLine"`   // End line (0-based)
	EndChar   int `json:"endChar"`   // End character (0-based)
}

// FlatCallHierarchyEntry represents a single relationship in a call hierarchy
type FlatCallHierarchyEntry struct {
	Callee    string     `json:"callee"`    // Symbol being called (just the symbol name)
	Caller    CallerInfo `json:"caller"`    // Information about the caller
	CallSites []CallSite `json:"callSites"` // Locations where the callee is called by the caller
}

// openQueryDB opens the SQLite database and registers the virtual table
func openQueryDB(dbPath string) (*sqlite.Conn, error) {
	// Open a connection to the database
	conn, err := sqlite.OpenConn(dbPath, sqlite.OpenReadOnly)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to open SQLite database at %s", dbPath)
	}

	// Register the SCIP occurrences virtual table module
	err = conn.SetModule("scip_occurrences", &sqlite.Module{
		Connect: scipOccurrencesConnect,
	})
	if err != nil {
		conn.Close()
		return nil, errors.Wrap(err, "failed to register scip_occurrences module")
	}

	return conn, nil
}

// gotoDefinitionQuery returns the location where a symbol is defined
func gotoDefinitionQuery(dbPath string, symbol string, out io.Writer) error {
	db, err := openQueryDB(dbPath)
	if err != nil {
		return err
	}
	defer db.Close()

	// Look up definitions for the symbol
	locations, err := findSymbolOccurrences(db, symbol, true)
	if err != nil {
		return err
	}

	if len(locations) == 0 {
		return errors.Errorf("no definition found for symbol: %s", symbol)
	}

	// Convert to JSON
	result, err := json.MarshalIndent(locations, "", "  ")
	if err != nil {
		return errors.Wrap(err, "failed to marshal result to JSON")
	}

	// Write the result
	_, err = fmt.Fprintln(out, string(result))
	return err
}

// findReferencesQuery returns all references to a symbol
func findReferencesQuery(dbPath string, symbol string, out io.Writer) error {
	db, err := openQueryDB(dbPath)
	if err != nil {
		return err
	}
	defer db.Close()

	// Look up references for the symbol
	locations, err := findSymbolOccurrences(db, symbol, false)
	if err != nil {
		return err
	}

	if len(locations) == 0 {
		return errors.Errorf("no references found for symbol: %s", symbol)
	}

	// Convert to JSON
	result, err := json.MarshalIndent(locations, "", "  ")
	if err != nil {
		return errors.Wrap(err, "failed to marshal result to JSON")
	}

	// Write the result
	_, err = fmt.Fprintln(out, string(result))
	return err
}

// callHierarchyQuery generates a call hierarchy for a symbol
func callHierarchyQuery(dbPath string, symbol string, maxDepth int, out io.Writer) error {
	db, err := openQueryDB(dbPath)
	if err != nil {
		return err
	}
	defer db.Close()

	// Check if the symbol exists
	var found bool

	err = sqlitex.Execute(db, "SELECT 1 FROM symbols WHERE symbol = ?", &sqlitex.ExecOptions{
		Args: []interface{}{symbol},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			found = true
			return nil
		},
	})

	if err != nil {
		return errors.Wrap(err, "failed to query symbols table")
	}

	if !found {
		return errors.Errorf("symbol not found: %s", symbol)
	}

	// Get flat call hierarchy
	entries, err := buildFlatCallHierarchy(db, symbol, maxDepth)
	if err != nil {
		return err
	}

	// Convert to JSON
	result, err := json.MarshalIndent(entries, "", "  ")
	if err != nil {
		return errors.Wrap(err, "failed to marshal result to JSON")
	}

	// Write the result
	_, err = fmt.Fprintln(out, string(result))
	return err
}

// findSymbolOccurrences looks up all occurrences of a symbol
func findSymbolOccurrences(db *sqlite.Conn, symbol string, definitionsOnly bool) ([]Location, error) {
	var locations []Location

	// Skip local symbols, which are not supported for queries
	if strings.HasPrefix(symbol, "local ") {
		return nil, errors.New("local symbols are not supported for this query")
	}

	// First, get the symbol ID
	var symbolID int64
	var found bool

	err := sqlitex.Execute(db, "SELECT id FROM symbols WHERE symbol = ?", &sqlitex.ExecOptions{
		Args: []interface{}{symbol},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			symbolID = stmt.ColumnInt64(0)
			found = true
			return nil
		},
	})

	if err != nil {
		return nil, errors.Wrap(err, "failed to query symbols table")
	}

	if !found {
		return nil, nil // No symbol found
	}

	// First, get relevant chunks from the mentions table
	type ChunkInfo struct {
		ChunkID    int64
		DocumentID int64
		FilePath   string
	}

	var chunks []ChunkInfo

	// Find all chunks that mention this symbol using the mentions table
	mentionsQuery := "SELECT c.id, c.document_id, d.relative_path " +
		"FROM mentions m " +
		"JOIN chunks c ON m.chunk_id = c.id " +
		"JOIN documents d ON c.document_id = d.id " +
		"WHERE m.symbol_id = ?"

	if definitionsOnly {
		mentionsQuery += " AND m.role = 1" // SymbolRole_Definition = 1
	}

	err = sqlitex.Execute(db, mentionsQuery, &sqlitex.ExecOptions{
		Args: []interface{}{symbolID},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			chunks = append(chunks, ChunkInfo{
				ChunkID:    stmt.ColumnInt64(0),
				DocumentID: stmt.ColumnInt64(1),
				FilePath:   stmt.ColumnText(2),
			})
			return nil
		},
	})

	if err != nil {
		return nil, errors.Wrap(err, "failed to query mentions table")
	}

	// Now, for each chunk, get the occurrences blob and query the scip_occurrences virtual table
	for _, chunk := range chunks {
		// Get the occurrences blob for this chunk
		var occurrencesBlob []byte

		err = sqlitex.Execute(db, "SELECT occurrences FROM chunks WHERE id = ?", &sqlitex.ExecOptions{
			Args: []interface{}{chunk.ChunkID},
			ResultFunc: func(stmt *sqlite.Stmt) error {
				occurrencesBlob = readBlob(stmt, 0)
				return nil
			},
		})

		if err != nil {
			return nil, errors.Wrapf(err, "failed to get occurrences blob for chunk %d", chunk.ChunkID)
		}

		if len(occurrencesBlob) == 0 {
			continue // Skip empty blobs
		}

		// Query the occurrences virtual table to get detailed occurrence information
		occSQL := "SELECT symbol, startLine, startChar, endLine, endChar, role FROM scip_occurrences " +
			"WHERE blob = ? AND symbol = ?"

		if definitionsOnly {
			occSQL += " AND role = 'definition'" // Filter by role name
		}

		oErr := sqlitex.Execute(db, occSQL, &sqlitex.ExecOptions{
			Args: []interface{}{occurrencesBlob, symbol},
			ResultFunc: func(stmt *sqlite.Stmt) error {
				// Extract location information
				// We don't need the symbol from the result as we already have it
				_ = stmt.ColumnText(0)
				startLine := stmt.ColumnInt64(1)
				startChar := stmt.ColumnInt64(2)
				endLine := stmt.ColumnInt64(3)
				endChar := stmt.ColumnInt64(4)
				role := stmt.ColumnText(5)

				location := Location{
					Path:      chunk.FilePath,
					Line:      int(startLine),
					Character: int(startChar),
					EndLine:   int(endLine),
					EndChar:   int(endChar),
					Symbol:    symbol, // Use the symbol parameter instead of oSymbol
					Role:      role,
				}

				locations = append(locations, location)
				return nil
			},
		})

		if oErr != nil {
			return nil, errors.Wrapf(oErr, "failed to query occurrences for chunk %d", chunk.ChunkID)
		}
	}

	return locations, nil
}

// getSymbolDefinitionLocation returns the definition location for a symbol
func getSymbolDefinitionLocation(db *sqlite.Conn, symbol string) (Location, error) {
	var location Location

	// Find the definition occurrence
	definitions, err := findSymbolOccurrences(db, symbol, true)
	if err != nil {
		return location, errors.Wrapf(err, "failed to find definition for %s", symbol)
	}

	if len(definitions) == 0 {
		return location, errors.Errorf("no definition found for symbol: %s", symbol)
	}

	return definitions[0], nil
}

// buildFlatCallHierarchy builds a flat call hierarchy for a symbol using efficient SQL joins
func buildFlatCallHierarchy(db *sqlite.Conn, rootSymbol string, maxDepth int) ([]FlatCallHierarchyEntry, error) {
	// Get the definition location of the root symbol
	rootLocation, err := getSymbolDefinitionLocation(db, rootSymbol)
	if err != nil {
		return nil, err
	}

	// Keep track of symbols we've already processed to avoid cycles
	processedSymbols := make(map[string]bool)
	processedSymbols[rootSymbol] = true

	// Queue for breadth-first search
	type queueItem struct {
		symbol string
		depth  int
	}

	queue := []queueItem{{symbol: rootSymbol, depth: 0}}
	result := []FlatCallHierarchyEntry{}

	// Map to store symbol definition locations for reuse
	symbolLocations := make(map[string]Location)
	symbolLocations[rootSymbol] = rootLocation

	// Map to efficiently group references by caller-callee-file pair
	type callerCalleePair struct {
		caller   string
		callee   string
		filePath string
	}

	relationshipMap := make(map[callerCalleePair]*FlatCallHierarchyEntry)

	// Process queue until empty or max depth reached
	for len(queue) > 0 {
		// Pop from queue
		current := queue[0]
		queue = queue[1:]

		// Skip if already at max depth
		if current.depth >= maxDepth {
			continue
		}

		// Find references to this symbol
		references, err := findReferencesWithCallers(db, current.symbol)
		if err != nil {
			return nil, errors.Wrapf(err, "failed to find references for %s", current.symbol)
		}

		// Group references by caller
		for _, ref := range references {
			// Caller filtering (for method/function symbols) is done in SQL
			// Allow self-references for recursive functions
			// We deliberately don't skip self-references to support recursive calls

			// Create key for caller-callee-file pair
			pair := callerCalleePair{
				caller:   ref.CallerSymbol,
				callee:   current.symbol,
				filePath: ref.FilePath,
			}

			// Get or create entry in the map
			entry, exists := relationshipMap[pair]
			if !exists {
				// Get caller definition location
				var callerLocation Location
				if loc, ok := symbolLocations[ref.CallerSymbol]; ok {
					callerLocation = loc
				} else {
					// Find the definition location
					loc, err := getSymbolDefinitionLocation(db, ref.CallerSymbol)
					if err != nil {
						// Use placeholder if no definition found
						callerLocation = ref.CallerLocation
					} else {
						callerLocation = loc
						symbolLocations[ref.CallerSymbol] = loc
					}
				}

				// We don't need the callee location in the new format
				// but we keep track of it in symbolLocations for possible future use

				// Create new entry
				entry = &FlatCallHierarchyEntry{
				Callee: current.symbol,
				Caller: CallerInfo{
				 Symbol:       ref.CallerSymbol,
				 RelativePath: ref.FilePath,
				 Range: Range{
				  StartLine: callerLocation.Line,
				   StartChar: callerLocation.Character,
								EndLine:   callerLocation.EndLine,
								EndChar:   callerLocation.EndChar,
							},
						},
						CallSites: []CallSite{},
					}

				relationshipMap[pair] = entry
			}

			// Add reference to the entry
			entry.CallSites = append(entry.CallSites, CallSite{
				RelativePath: ref.FilePath,
				Range: Range{
					StartLine: ref.RefLocation.Line,
					StartChar: ref.RefLocation.Character,
					EndLine:   ref.RefLocation.EndLine,
					EndChar:   ref.RefLocation.EndChar,
				},
			})

			// Add caller to queue if not already processed
			if !processedSymbols[ref.CallerSymbol] {
				queue = append(queue, queueItem{symbol: ref.CallerSymbol, depth: current.depth + 1})
				processedSymbols[ref.CallerSymbol] = true
			}
		}
	}

	// Convert map to slice and sort in BFS order
	// Track the symbols in BFS order to ensure proper ordering
	orderedSymbols := []string{rootSymbol} // Start with root symbol
	
	// Add remaining symbols in the order they were discovered
	for i := 0; i < len(orderedSymbols); i++ {
		symbol := orderedSymbols[i]
		
		// First, add entries where this symbol is the callee
		for pair, entry := range relationshipMap {
			// Caller filtering (for method/function symbols) is done in SQL
			if pair.callee == symbol {
				result = append(result, *entry)
				
				// Add caller to ordered symbols if not already there
				alreadyAdded := false
				for _, s := range orderedSymbols {
					if s == pair.caller {
						alreadyAdded = true
						break
					}
				}
				
				if !alreadyAdded {
					orderedSymbols = append(orderedSymbols, pair.caller)
				}
			}
		}
	}
	
	return result, nil
}

// SymbolReference represents a reference to a symbol along with its enclosing definition
type SymbolReference struct {
	CallerSymbol   string   // The enclosing definition's symbol
	CallerLocation Location // Location of the caller definition
	RefLocation    Location // Location of the reference
	FilePath       string   // File path containing the reference
}

// findReferencesWithCallers finds all references to a symbol and their enclosing definitions
// Groups results by (caller, callee) pairs directly in SQL for better performance
func findReferencesWithCallers(db *sqlite.Conn, symbol string) ([]SymbolReference, error) {
	// Get the symbol ID
	var symbolID int64
	var found bool

	err := sqlitex.Execute(db, "SELECT id FROM symbols WHERE symbol = ?", &sqlitex.ExecOptions{
		Args: []interface{}{symbol},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			symbolID = stmt.ColumnInt64(0)
			found = true
			return nil
		},
	})

	if err != nil || !found {
		return nil, errors.Wrap(err, "failed to query symbols table")
	}

	// Data structure to store grouped references
	type callerGroup struct {
		callerSymbol    string
		callerStartLine int
		callerStartChar int
		callerEndLine   int
		callerEndChar   int
		filePath        string
		references      []Location
	}

	// Map to store grouped references by (caller, callee, filepath)
	type groupKey struct {
		caller   string
		filePath string
	}
	groupedRefs := make(map[groupKey]*callerGroup)

	// Query documents with references
	docQuery := `
		SELECT DISTINCT d.id, d.relative_path
		FROM mentions m
		JOIN chunks c ON m.chunk_id = c.id
		JOIN documents d ON c.document_id = d.id
		WHERE m.symbol_id = ? AND m.role != 1 -- Exclude definitions
	`

	err = sqlitex.Execute(db, docQuery, &sqlitex.ExecOptions{
		Args: []interface{}{symbolID},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			documentID := stmt.ColumnInt64(0)
			filePath := stmt.ColumnText(1)

			// For each document, find references and group by caller
			// Using a Common Table Expression (CTE) for better readability and performance
			combinedQuery := `
				WITH reference_locations AS (
					-- Get all reference locations from chunks in this document
					SELECT 
						o.startLine, 
						o.startChar
					FROM chunks c
					JOIN mentions m ON c.id = m.chunk_id
					CROSS JOIN scip_occurrences o ON o.blob = c.occurrences 
					                          AND o.symbol = ? 
					                          AND o.role != 'definition'
					WHERE c.document_id = ? 
					  AND m.symbol_id = ? 
					  AND m.role != 1
				)
				-- Join with defn_trees to find enclosing definition for each reference
				-- Group by caller symbol to aggregate references under the same caller
				SELECT 
					s.symbol AS caller_symbol,
					d.start_line,
					d.start_char,
					d.end_line,
					d.end_char,
					r.startLine,
					r.startChar
				FROM reference_locations r
				JOIN defn_trees d ON d.document_id = ?
				                  AND d.start_line <= r.startLine 
				                  AND d.end_line >= r.startLine
				JOIN symbols s ON d.symbol_id = s.id
				-- Only include method/function callers (must end with ").") and allow self-referential calls
				WHERE s.symbol LIKE '%).'
				ORDER BY s.symbol, r.startLine, r.startChar
			`

			err := sqlitex.Execute(db, combinedQuery, &sqlitex.ExecOptions{
				Args: []interface{}{symbol, documentID, symbolID, documentID},
				ResultFunc: func(stmt *sqlite.Stmt) error {
					callerSymbol := stmt.ColumnText(0)
					callerStartLine := int(stmt.ColumnInt64(1))
					callerStartChar := int(stmt.ColumnInt64(2))
					callerEndLine := int(stmt.ColumnInt64(3))
					callerEndChar := int(stmt.ColumnInt64(4))
					refLine := int(stmt.ColumnInt64(5))
					refChar := int(stmt.ColumnInt64(6))

					// Create reference location
					refLocation := Location{
						Path:      filePath,
						Line:      refLine,
						Character: refChar,
						Role:      "reference",
					}

					// Group by caller+file
					key := groupKey{caller: callerSymbol, filePath: filePath}
					group, exists := groupedRefs[key]

					if !exists {
						// Create a new group
						group = &callerGroup{
							callerSymbol:    callerSymbol,
							callerStartLine: callerStartLine,
							callerStartChar: callerStartChar,
							callerEndLine:   callerEndLine,
							callerEndChar:   callerEndChar,
							filePath:        filePath,
							references:      []Location{},
						}
						groupedRefs[key] = group
					}

					// Add reference to group
					group.references = append(group.references, refLocation)
					return nil
				},
			})

			if err != nil {
				return errors.Wrapf(err, "failed to query references in document %s", filePath)
			}
			return nil
		},
	})

	if err != nil {
		return nil, errors.Wrap(err, "failed to query documents")
	}

	// Convert grouped references to SymbolReference array
	var references []SymbolReference

	for _, group := range groupedRefs {
		callerLocation := Location{
			Path:      group.filePath,
			Line:      group.callerStartLine,
			Character: group.callerStartChar,
			EndLine:   group.callerEndLine,
			EndChar:   group.callerEndChar,
			Role:      "definition",
		}

		for _, refLoc := range group.references {
			references = append(references, SymbolReference{
				CallerSymbol:   group.callerSymbol,
				CallerLocation: callerLocation,
				RefLocation:    refLoc,
				FilePath:       group.filePath,
			})
		}
	}

	return references, nil
}

// buildCallHierarchy recursively builds a call hierarchy for a symbol
func buildCallHierarchy(db *sqlite.Conn, node *CallHierarchyItem, depth int, maxDepth int, visitedSymbols map[string]bool, out io.Writer) error {
	if depth >= maxDepth {
		return nil
	}

	// Get the symbol ID for the current node
	var symbolID int64

	err := sqlitex.Execute(db, "SELECT id FROM symbols WHERE symbol = ?", &sqlitex.ExecOptions{
		Args: []interface{}{node.Symbol},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			symbolID = stmt.ColumnInt64(0)
			return nil
		},
	})

	if err != nil {
		return errors.Wrap(err, "failed to get symbol ID")
	}

	// Find all chunks that reference this symbol
	type ReferenceInfo struct {
		ChunkID    int64
		DocumentID int64
		FilePath   string
	}

	var references []ReferenceInfo

	// Query directly from the mentions table
	query := `
		SELECT c.id, c.document_id, d.relative_path 
		FROM mentions m
		JOIN chunks c ON m.chunk_id = c.id
		JOIN documents d ON c.document_id = d.id
		WHERE m.symbol_id = ? AND m.role != 1 -- SymbolRole_Definition=1
	`

	err = sqlitex.Execute(db, query, &sqlitex.ExecOptions{
		Args: []interface{}{symbolID},
		ResultFunc: func(stmt *sqlite.Stmt) error {
			references = append(references, ReferenceInfo{
				ChunkID:    stmt.ColumnInt64(0),
				DocumentID: stmt.ColumnInt64(1),
				FilePath:   stmt.ColumnText(2),
			})
			return nil
		},
	})

	if err != nil {
		return errors.Wrap(err, "failed to query references")
	}

	// Process each reference chunk
	for _, ref := range references {
		// Get the occurrences blob for this chunk
		var occurrencesBlob []byte

		err = sqlitex.Execute(db, "SELECT occurrences FROM chunks WHERE id = ?", &sqlitex.ExecOptions{
			Args: []interface{}{ref.ChunkID},
			ResultFunc: func(stmt *sqlite.Stmt) error {
				occurrencesBlob = readBlob(stmt, 0)
				return nil
			},
		})

		if err != nil || len(occurrencesBlob) == 0 {
			continue
		}

		// Get actual reference locations from the chunk's occurrences
		type RefLocation struct {
			Line int
			Char int
		}
		var locations []RefLocation

		// Query the occurrences virtual table to find exact reference locations
		occSQL := "SELECT startLine, startChar FROM scip_occurrences " +
			"WHERE blob = ? AND symbol = ? AND role != 'definition'" // Exclude definitions

		err = sqlitex.Execute(db, occSQL, &sqlitex.ExecOptions{
			Args: []interface{}{occurrencesBlob, node.Symbol},
			ResultFunc: func(stmt *sqlite.Stmt) error {
				locations = append(locations, RefLocation{
					Line: int(stmt.ColumnInt64(0)),
					Char: int(stmt.ColumnInt64(1)),
				})
				return nil
			},
		})

		if err != nil {
			continue
		}

		if len(locations) == 0 {
			continue
		}

		// For each reference location, find the enclosing definition from defn_trees
		for _, loc := range locations {
			// Find the enclosing definition that contains this reference
			defnQuery := `
				SELECT d.*, s.symbol FROM defn_trees d
				JOIN symbols s ON d.symbol_id = s.id
				WHERE d.document_id = ?
				  AND d.start_line <= ?
				  AND d.end_line >= ?
				  AND s.symbol != ?
				ORDER BY (d.end_line - d.start_line) ASC
			`

			err = sqlitex.Execute(db, defnQuery, &sqlitex.ExecOptions{
				Args: []interface{}{ref.DocumentID, loc.Line, loc.Line, node.Symbol},
				ResultFunc: func(stmt *sqlite.Stmt) error {
					symbolName := stmt.ColumnText(7)

					// Skip if the symbol is the same or we've already visited it
					if symbolName == node.Symbol || visitedSymbols[symbolName] {
						return nil
					}

					// Create a new node in the call hierarchy
					child := CallHierarchyItem{
						Symbol: symbolName,
						Location: Location{
							Path:      ref.FilePath,
							Line:      int(stmt.ColumnInt64(3)), // start_line
							Character: int(stmt.ColumnInt64(4)), // start_char
							EndLine:   int(stmt.ColumnInt64(5)), // end_line
							EndChar:   int(stmt.ColumnInt64(6)), // end_char
							Symbol:    symbolName,
							Role:      "definition",
						},
					}

					// Add to visited symbols to prevent cycles
					visitedSymbols[symbolName] = true

					// Add to the callers list - check for duplicates
					alreadyAdded := false
					for _, existing := range node.Callers {
						if existing.Symbol == symbolName {
							alreadyAdded = true
							break
						}
					}

					if !alreadyAdded {
						node.Callers = append(node.Callers, child)
					}

					return nil
				},
			})

			if err != nil {
				return errors.Wrap(err, "failed to query defn_trees")
			}
		}
	}

	// Now recursively build the hierarchy for each child node
	for i := range node.Callers {
		err = buildCallHierarchy(db, &node.Callers[i], depth+1, maxDepth, visitedSymbols, out)
		if err != nil {
			return err
		}
	}

	return nil
}

// readBlob reads a blob from a SQLite statement column
func readBlob(stmt *sqlite.Stmt, col int) []byte {
	reader := stmt.ColumnReader(col)
	data, err := io.ReadAll(reader)
	if err != nil {
		return nil
	}
	return data
}
