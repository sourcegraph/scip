#!/usr/bin/env bash

set -xeuo pipefail

./dev/proto-generate.sh

./cmd/scip/tests/reprolang/generate-tree-sitter-parser.sh
