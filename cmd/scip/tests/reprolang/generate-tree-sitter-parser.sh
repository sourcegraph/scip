#!/usr/bin/env bash
set -eux
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"
yarn install
./node_modules/.bin/tree-sitter generate --abi 13
yarn --cwd ../../../.. run prettier
