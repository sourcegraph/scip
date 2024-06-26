#!/usr/bin/env bash

set -xeuo pipefail

# We're explicitly overriding the node_modules location used by Yarn because 
# of issues when mounting node_modules inside the docker container AND running
# it under non-root user.

# Symlinking won't work: https://github.com/yarnpkg/yarn/issues/8079#issuecomment-622817604
# node_modules mounting is a known issue: https://stackoverflow.com/questions/29181032/add-a-volume-to-docker-but-exclude-a-sub-folder

echo "--modules-folder $HOME/my-node-modules" > $HOME/.yarnrc

export PATH="$PATH:$HOME/my-node-modules/.bin"
export NODE_PATH="$HOME/my-node-modules"

./dev/proto-generate.sh

./cmd/scip/tests/reprolang/generate-tree-sitter-parser.sh
