#!/usr/bin/env bash

set -xeuo pipefail

# We're explicitly overriding the node_modules location used by Yarn because 
# of issues when mounting node_modules inside the docker container AND running
# it under non-root user.

echo "--modules-folder $HOME/my-node-modules" > .yarnrc

export PATH="$PATH:$HOME/my-node-modules/.bin"
export NODE_PATH="$HOME/my-node-modules"

./dev/proto-generate.sh

./cmd/scip/tests/reprolang/generate-tree-sitter-parser.sh
