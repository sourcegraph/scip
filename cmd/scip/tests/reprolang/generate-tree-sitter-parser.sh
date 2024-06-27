#!/usr/bin/env bash
set -eux
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"
yarn install

# See https://github.com/smacker/go-tree-sitter/issues/85#issuecomment-1287988200
./node_modules/.bin/tree-sitter generate --abi 13

yarn --cwd ../../../.. run prettier
