#!/usr/bin/env bash
set -eux
cd "$(dirname "${BASH_SOURCE[0]}")"

tree-sitter generate --abi 14 --output grammar
prettier --write 'grammar/grammar.json' 'grammar/node-types.json'
