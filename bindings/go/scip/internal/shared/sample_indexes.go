package shared

import (
	"crypto/sha256"
	"encoding/json"
	"fmt"
	"os"
	"path"
	"path/filepath"
	"slices"
	"strings"
)

// SampleIndexes returns a list of paths to SCIP indexes for testing/benchmarking.
func SampleIndexes() []string {
	workDir, err := os.Getwd()
	if err != nil {
		panic(fmt.Sprintf("failed to get working directory: %v", err))
	}
	components := strings.Split(workDir, "/")
	fmt.Printf("")
	var dirEntries []os.DirEntry
	var indexesDir string
	var metadataPath string
	var allMetadata indexesMetadata
	for i := 0; i < len(components); i++ {
		if components[i] != "scip" {
			continue
		}
		indexesDir = filepath.Join("/", filepath.Join(components[:i+1]...), "dev", "sample_indexes")
		dirEntries, err = os.ReadDir(indexesDir)
		if err != nil {
			fmt.Fprintf(os.Stderr, "Could not locate sample indexes directory at: %v\n", err.Error())
			continue
		}
		metadataPath = filepath.Join(indexesDir, "indexes-metadata.json")
		indexMetadataContents, err := os.ReadFile(metadataPath)
		if err != nil {
			panic(fmt.Sprintf("Failed to find metadata file for verifying SHAs: %s\n", err.Error()))
		}
		if err = json.Unmarshal(indexMetadataContents, &allMetadata); err != nil {
			panic(fmt.Sprintf("Failed to parse metadata file: %s (path: %q)\n", err.Error(), metadataPath))
		}
		break
	}
	if len(dirEntries) == 0 {
		panic(fmt.Sprintf("could not locate sample indexes directory starting from parents of working directory: %q", workDir))
	}
	out := []string{}
	for _, entry := range dirEntries {
		if strings.HasSuffix(entry.Name(), ".scip") {
			indexPath := path.Join(indexesDir, entry.Name())
			if err := allMetadata.compareSHA(indexPath); err != nil {
				panic(err)
			}
			out = append(out, indexPath)
		}
	}
	return out
}

type indexesMetadata struct {
	Indexes []metadataEntry `json:"indexes"`
}

func (m *indexesMetadata) compareSHA(path string) error {
	filename := filepath.Base(path)
	idx := slices.IndexFunc(m.Indexes, func(m metadataEntry) bool {
		return m.Name == filename
	})
	if idx == -1 {
		return fmt.Errorf("indexes-metadata.json missing entry for file %q", filename)
	}
	contents, err := os.ReadFile(path)
	if err != nil {
		return fmt.Errorf("failed to read index file at path %q: %w", path, err)
	}
	if got := computeSHA256(contents); got != m.Indexes[idx].SHA256 {
		return fmt.Errorf("index file SHA mismatch (-want, got):\n-%s (from indexes-metadata.json)\n+%s",
			m.Indexes[idx].SHA256, got)
	}
	return nil
}

type metadataEntry struct {
	Name   string `json:"name"`
	SHA256 string `json:"sha256"`
}

func computeSHA256(contents []byte) string {
	hasher := sha256.New()
	hasher.Write(contents)
	return fmt.Sprintf("%x", hasher.Sum(nil))
}
