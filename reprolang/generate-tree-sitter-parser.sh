#!/usr/bin/env bash
set -eux
cd "$(dirname "${BASH_SOURCE[0]}")"

tree-sitter generate --abi 14
prettier --write 'src/grammar.json' 'src/node-types.json'
