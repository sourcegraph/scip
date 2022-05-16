package main

import (
	"testing"

	docopt "github.com/docopt/docopt-go"
	"github.com/stretchr/testify/require"
)

func TestArgumentParsing(t *testing.T) {
	type argMap = map[string]any
	testCases := []struct {
		argv []string
		keys argMap
	}{
		{[]string{"-h"}, argMap{"--help": true}},
		{[]string{"--help"}, argMap{"--help": true}},
		{[]string{"convert"}, argMap{"--from": "index.scip", "--to": "dump.lsif"}},
		{[]string{"convert", "--from", "tmp.scip"}, argMap{"--from": "tmp.scip"}},
		{[]string{"convert", "--from=tmp.scip"}, argMap{"--from": "tmp.scip"}},
		{[]string{"convert", "--to=tmp.lsif"}, argMap{"--to": "tmp.lsif"}},
		{[]string{"convert", "--from=tmp.scip", "--to=tmp.lsif"}, argMap{"--from": "tmp.scip", "--to": "tmp.lsif"}},
		{[]string{"convert", "--to=tmp.lsif", "--from=tmp.scip"}, argMap{"--from": "tmp.scip", "--to": "tmp.lsif"}},
		{
			[]string{"snapshot", "--output-directory=a/b/c", "--comment-syntax=# <content>"},
			argMap{"--index-file": "index.scip", "--output-directory": "a/b/c", "--comment-syntax": "# <content>"},
		},
		{
			[]string{"snapshot", "--index-file=a.scip", "--output-directory=a/b/c", `--comment-syntax=# <content>`},
			argMap{"--index-file": "a.scip", "--output-directory": "a/b/c", "--comment-syntax": `# <content>`},
		},
	}
	parser := docopt.Parser{SkipHelpFlags: true}
	for _, testCase := range testCases {
		parsedArgs, err := parser.ParseArgs(helpText(), testCase.argv, "")
		if testCase.keys == nil {
			require.Error(t, err)
			continue
		}
		for k, v := range testCase.keys {
			require.Equal(t, v, parsedArgs[k])
		}
	}
}
