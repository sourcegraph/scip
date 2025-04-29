package main

import (
	"bytes"
	"cmp"
	"path/filepath"
	"testing"

	"github.com/klauspost/compress/zstd"
	"github.com/stretchr/testify/require"
	"golang.org/x/exp/slices"
	"zombiezen.com/go/sqlite"
	"zombiezen.com/go/sqlite/sqlitex"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

func TestConvert_SmokeTest(t *testing.T) {
	// Create temp directory for test DB
	tempDir := t.TempDir()

	sqliteDBPath := filepath.Join(tempDir, "index.db")

	pkg1S1Sym := "scip-go go . . pkg1/S1#"
	index := &scip.Index{
		Documents: []*scip.Document{
			{
				RelativePath: "a.go",
				Occurrences: []*scip.Occurrence{
					{Symbol: pkg1S1Sym, Range: []int32{10, 3, 6}, SymbolRoles: int32(scip.SymbolRole_Definition)},
				},
				Symbols: []*scip.SymbolInformation{
					{Symbol: pkg1S1Sym},
				},
			},
			{
				RelativePath: "b.go",
				Occurrences: []*scip.Occurrence{
					{Symbol: pkg1S1Sym, Range: []int32{15, 9, 12}},
				},
			},
		},
	}

	db, err := createSQLiteDatabase(sqliteDBPath)
	require.NoError(t, err)
	defer func() { require.NoError(t, db.Close()) }()

	writer, err := zstd.NewWriter(nil)
	require.NoError(t, err)
	converter := NewConverter(db, chunkSizeHint, writer)
	err = converter.Convert(index)
	require.NoError(t, err)

	checkDocuments := func(db *sqlite.Conn) {
		query := "SELECT relative_path FROM documents"
		var dbPaths []string
		err := sqlitex.ExecuteTransient(db, query, &sqlitex.ExecOptions{
			ResultFunc: func(stmt *sqlite.Stmt) error {
				dbPaths = append(dbPaths, stmt.ColumnText(0))
				return nil
			},
		})
		require.NoError(t, err)
		var expectedPaths []string
		for _, doc := range index.Documents {
			expectedPaths = append(expectedPaths, doc.RelativePath)
		}
		slices.Sort(expectedPaths)
		expectedPaths = slices.Compact(expectedPaths)
		slices.Sort(dbPaths)

		require.Equal(t, expectedPaths, dbPaths)
	}

	checkSymbols := func(db *sqlite.Conn) {
		query := "SELECT symbol FROM global_symbols"
		var dbSymbols []string
		err := sqlitex.ExecuteTransient(db, query, &sqlitex.ExecOptions{
			ResultFunc: func(stmt *sqlite.Stmt) error {
				dbSymbols = append(dbSymbols, stmt.ColumnText(0))
				return nil
			},
		})
		require.NoError(t, err)

		var expectedSymbols []string
		for _, doc := range index.Documents {
			for _, occ := range doc.Occurrences {
				expectedSymbols = append(expectedSymbols, occ.Symbol)
			}
			for _, sym := range doc.Symbols {
				expectedSymbols = append(expectedSymbols, sym.Symbol)
			}
		}
		slices.Sort(expectedSymbols)
		expectedSymbols = slices.Compact(expectedSymbols)
		slices.Sort(dbSymbols)

		require.Equal(t, expectedSymbols, dbSymbols)
	}

	zstdReader, err := zstd.NewReader(bytes.NewBuffer(nil))
	require.NoError(t, err)

	checkOccurrences := func(db *sqlite.Conn) {
		query := `SELECT d.relative_path, occurrences
				  FROM documents d
				  JOIN chunks c ON c.document_id = d.id`
		dbOccurrences := []occurrenceData{}
		err := sqlitex.ExecuteTransient(db, query, &sqlitex.ExecOptions{
			ResultFunc: func(stmt *sqlite.Stmt) error {
				var c Chunk
				err = c.fromDBFormat(stmt.ColumnReader(1), zstdReader)
				require.NoError(t, err)
				for _, occ := range c.Occurrences {
					dbOccurrences = append(dbOccurrences, occurrenceData{
						DocumentPath: stmt.ColumnText(0),
						Symbol:       occ.Symbol,
						Role:         occ.SymbolRoles,
						Range:        scip.NewRangeUnchecked(occ.Range),
					})
				}
				return nil
			},
		})
		require.NoError(t, err)
		cmpFn := func(a, b occurrenceData) int {
			return cmp.Or(cmp.Compare(a.DocumentPath, b.DocumentPath),
				a.Range.CompareStrict(b.Range))
		}
		slices.SortFunc(dbOccurrences, cmpFn)

		var expectedOccurrences []occurrenceData
		for _, doc := range index.Documents {
			for _, occ := range doc.Occurrences {
				expectedOccurrences = append(expectedOccurrences, occurrenceData{
					DocumentPath: doc.RelativePath,
					Symbol:       occ.Symbol,
					Role:         occ.SymbolRoles,
					Range:        scip.NewRangeUnchecked(occ.Range),
				})
			}
		}
		slices.SortFunc(expectedOccurrences, cmpFn)

		require.Equal(t, expectedOccurrences, dbOccurrences)
	}

	checkDocuments(db)
	checkSymbols(db)
	checkOccurrences(db)
}

type occurrenceData struct {
	DocumentPath string
	Symbol       string
	Role         int32
	Range        scip.Range
}
