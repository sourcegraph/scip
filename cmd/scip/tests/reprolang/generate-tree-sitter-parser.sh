#!/usr/bin/env bash
set -eux
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

# Requires tree-sitter from nix dev shell (nix develop --impure)
tree-sitter generate --abi 14

yarn --cwd ../../../.. run prettier
