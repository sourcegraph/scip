package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/url"
	"os"
	"path/filepath"

	"github.com/hhatto/gocloc"
	"github.com/urfave/cli/v2"

	"github.com/sourcegraph/sourcegraph/lib/errors"

	"github.com/sourcegraph/scip/bindings/go/scip"
)

type statsFlags struct {
	from              string
	customProjectRoot string
}

func statsCommand() cli.Command {
	var statsFlags statsFlags
	stats := cli.Command{
		Name:  "stats",
		Usage: "Output useful statistics about a SCIP index",
		Flags: []cli.Flag{
			fromFlag(&statsFlags.from),
			projectRootFlag(&statsFlags.customProjectRoot),
		},
		Action: func(c *cli.Context) error {
			return statsMain(statsFlags)
		},
	}
	return stats
}

func statsMain(flags statsFlags) error {
	from := flags.from
	index, err := readFromOption(from)
	if err != nil {
		return errors.Wrap(err, "error reading SCIP file")
	}
	if index.Metadata == nil {
		return errors.Errorf("Index.Metadata is nil (--from=%s)", from)
	}
	output := map[string]interface{}{}
	indexStats, err := countStatistics(index, flags.customProjectRoot)
	if err != nil {
		return errors.Wrap(err, "error counting stats")
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

func countStatistics(index *scip.Index, customProjectRoot string) (*indexStatistics, error) {
	loc, err := countLinesOfCode(index, customProjectRoot)
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
			if scip.SymbolRole_Definition.Matches(occurrence) {
				stats.Definitions += 1
			}
		}
	}
	return stats, nil
}

func countLinesOfCode(index *scip.Index, customProjectRoot string) (*gocloc.Result, error) {
	var localSource string
	root, err := url.Parse(index.Metadata.ProjectRoot)
	if err != nil {
		return nil, errors.Wrapf(err, "failed to parse Index.Metadata.ProjectRoot as a URI %s", index.Metadata.ProjectRoot)
	}
	if customProjectRoot != "" {
		localSource = customProjectRoot
	} else {
		_, err := os.Stat(root.Path)
		if errors.Is(err, os.ErrNotExist) {
			cwd, _ := os.Getwd()
			log.Printf("Project root [%s] doesn't exist, using current working directory [%s] instead. "+
				"To override this behaviour, specify --project-root=<folder> option", root.Path, cwd)
			localSource = cwd
		} else if err != nil {
			return nil, err
		}
	}

	stat, err := os.Stat(localSource)
	if err != nil {
		return nil, err
	}
	if !stat.IsDir() {
		return nil, errors.Errorf("Project root [%s] is not a directory", localSource)
	}
	processor := gocloc.NewProcessor(gocloc.NewDefinedLanguages(), gocloc.NewClocOptions())
	var paths []string
	for _, document := range index.Documents {
		paths = append(paths, filepath.Join(localSource, document.RelativePath))
	}
	return processor.Analyze(paths)
}
