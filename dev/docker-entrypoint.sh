#!/usr/bin/env bash

set -xeuo pipefail

# We're explicitly overriding the node_modules location used by Yarn because 
# of issues when mounting node_modules inside the docker container AND running
# it under non-root user.

# Symlinking won't work: https://github.com/yarnpkg/yarn/issues/8079#issuecomment-622817604
# node_modules mounting is a known issue: https://stackoverflow.com/questions/29181032/add-a-volume-to-docker-but-exclude-a-sub-folder

CUSTOM_NODE_MODULES="$HOME/my-node-modules"

mkdir -p $CUSTOM_NODE_MODULES && chmod 0777 $CUSTOM_NODE_MODULES && chown -R asdf:asdf $CUSTOM_NODE_MODULES

echo "--modules-folder $CUSTOM_NODE_MODULES" > $HOME/.yarnrc

export PATH="$PATH:$CUSTOM_NODE_MODULES/.bin"
export NODE_PATH="$CUSTOM_NODE_MODULES"

./dev/proto-generate.sh

./cmd/scip/tests/reprolang/generate-tree-sitter-parser.sh
