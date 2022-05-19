package main

import (
	"encoding/json"
	"fmt"
	"net/url"
	"path/filepath"

	"github.com/hhatto/gocloc"
	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/sourcegraph/lib/errors"
)

func statsMain(parsedArgs map[string]interface{}) error {
	from := parsedArgs["--from"].(string)
	index, err := readFromOption(from)
	if err != nil {
		return err
	}
	if index.Metadata == nil {
		return errors.Errorf("Index.Metadata is nil (--from=%s)", from)
	}
	output := map[string]interface{}{}
	indexStats, err := countStatistics(index)
	if err != nil {
		return err
	}
	jsonBytes, err := json.MarshalIndent(indexStats, "", "  ")
	if err != nil {
		return errors.Wrapf(err, "failed to marshall into JSON %s", output)
	}
	fmt.Println(string(jsonBytes))
	return nil
}

type indexStatistics struct {
	Documents   int32 `json:"documents"`
	LinesOfCode int32 `json:"linesOfCode"`
	Occurrences int32 `json:"occurrences"`
	Definitions int32 `json:"definitions"`
}

func countStatistics(index *scip.Index) (*indexStatistics, error) {
	loc, err := countLinesOfCode(index)
	if err != nil {
		return nil, err
	}
	stats := &indexStatistics{
		Documents:   int32(len(index.Documents)),
		LinesOfCode: loc.Total.Code,
		Occurrences: 0,
		Definitions: 0,
	}
	for _, document := range index.Documents {
		for _, occurrence := range document.Occurrences {
			stats.Occurrences += 1
			if occurrence.SymbolRoles&int32(scip.SymbolRole_Definition) > 0 {
				stats.Definitions += 1
			}
		}
	}
	return stats, nil
}

func countLinesOfCode(index *scip.Index) (*gocloc.Result, error) {
	root, err := url.Parse(index.Metadata.ProjectRoot)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to parse Index.Metadata.ProjectRoot as a URI %s", index.Metadata.ProjectRoot)
	}
	processor := gocloc.NewProcessor(gocloc.NewDefinedLanguages(), gocloc.NewClocOptions())
	var paths []string
	for _, document := range index.Documents {
		paths = append(paths, filepath.Join(root.Path, document.RelativePath))
	}
	return processor.Analyze(paths)
}
