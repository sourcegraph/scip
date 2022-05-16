package main

import (
	"os"
	"strings"

	"github.com/sourcegraph/sourcegraph/lib/errors"

	"github.com/sourcegraph/scip/bindings/go/scip"
	"github.com/sourcegraph/scip/cmd/internal/testutil"
)

func snapshotMain(parsedArgs map[string]any) error {
	fromPath := parsedArgs["--index-file"].(string)
	scipReader, err := makeSCIPReader(fromPath)
	if err != nil {
		return err
	}
	defer scipReader.Close()

	outDir := parsedArgs["--output-directory"].(string)
	err = os.MkdirAll(outDir, 0666)
	if err != nil {
		return errors.Wrap(err, "failed to prepare output directory for snapshots")
	}

	commentSyntax := parsedArgs["--comment-syntax"].(string)
	if !strings.Contains(commentSyntax, "<content>") {
		return errors.New("--comment-syntax's argument should have <content> as a substring")
	}

	scipIndex, err := readAndParseSCIP(scipReader, fromPath)
	if err != nil {
		return err
	}

	testutil.FormatSnapshots(scipIndex, commentSyntax, scip.DescriptorOnlyFormatter)

	return nil
}
