#!/usr/bin/env bash

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.." # cd to repo root dir

echo "--- yarn in root ---"
yarn --cwd ./bindings/typescript install --frozen-lockfile

echo "--- cargo install rust-protobuf ---"
PROTOC_GEN_RUST_VERSION="$(cat bindings/rust/Cargo.toml | grep 'protobuf =' | sed -E 's/.*\"=(.+)\"/\1/g')"
if ! grep -q "$PROTOC_GEN_RUST_VERSION" "./.bin/PROTOC_GEN_RUST_VERSION" \
   || ! test -f "./.bin/bin/protoc-gen-rust"; then
  rm -rf .bin
  cargo install --root .bin protobuf-codegen --version 3.1.0
  echo "$PROTOC_GEN_RUST_VERSION" > "./.bin/PROTOC_GEN_RUST_VERSION"
fi

echo "--- buf ---"

# Keep in sync with bindings/go/scip/tools.go
GOBIN="$PWD/.bin" go install github.com/bufbuild/buf/cmd/buf
GOBIN="$PWD/.bin" go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc
GOBIN="$PWD/.bin" go install golang.org/x/tools/cmd/goimports
GOBIN="$PWD/.bin" go install google.golang.org/protobuf/cmd/protoc-gen-go

GOBIN="$PWD/.bin" ./.bin/buf generate
./.bin/goimports -w ./bindings/go/scip/scip.pb.go
yarn run prettier

