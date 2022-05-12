#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.." # cd to repo root dir

echo "--- yarn in root ---"
yarn --cwd ./bindings/typescript install --frozen-lockfile

echo "--- cargo install rust-protobuf ---"
# Keep protobuf-codegen version in sync with rust/Cargo.toml
which ./.bin/bin/protoc-gen-rust || cargo install --root .bin protobuf-codegen --version 3.0.2

echo "--- buf ---"

# Keep in sync with bindings/go/scip/tools.go
GOBIN="$PWD/.bin" go install github.com/bufbuild/buf/cmd/buf
GOBIN="$PWD/.bin" go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc
GOBIN="$PWD/.bin" go install golang.org/x/tools/cmd/goimports
GOBIN="$PWD/.bin" go install google.golang.org/protobuf/cmd/protoc-gen-go

GOBIN="$PWD/.bin" ./.bin/buf generate
./.bin/goimports -w ./bindings/go/scip/scip.pb.go
