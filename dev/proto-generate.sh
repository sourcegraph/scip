#!/usr/bin/env bash

set -xeuo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.." # cd to repo root dir

echo "--- yarn in root ---"
yarn --cwd ./bindings/typescript install --frozen-lockfile

echo "--- cargo install rust-protobuf ---"
PROTOC_GEN_RUST_VERSION="$(cat bindings/rust/Cargo.toml | grep 'protobuf =' | sed -E 's/.*\"=(.+)\"/\1/g')"
if ! grep -q "$PROTOC_GEN_RUST_VERSION" "./.bin/PROTOC_GEN_RUST_VERSION" \
   || ! test -f "./.bin/bin/protoc-gen-rs"; then
  rm -rf .bin
  cargo install --root .bin protobuf-codegen --version 3.7.1 --locked
  echo "$PROTOC_GEN_RUST_VERSION" > "./.bin/PROTOC_GEN_RUST_VERSION"
fi


echo "--- Haskell ---"
command -v cabal > /dev/null 2>&1 || { echo >&2 "Haskell's 'cabal' command is not installed. Please install it first via https://www.haskell.org/ghcup/"; exit 1; }
cabal install proto-lens-protoc-0.8.0.1 ghc-source-gen-0.4.5.0 --overwrite-policy=always --ghc-options='-j2 +RTS -A32m' --installdir="$PWD/.bin"
# buf requires the generator to be named protoc-gen-*
ln -sfv "$PWD/.bin/proto-lens-protoc" "$PWD/.bin/protoc-gen-haskell"
PATH="$PWD/.bin:$PATH"

echo "--- buf ---"

# Keep in sync with bindings/go/scip/tools.go
GOBIN="$PWD/.bin" go install github.com/bufbuild/buf/cmd/buf
GOBIN="$PWD/.bin" go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc
GOBIN="$PWD/.bin" go install golang.org/x/tools/cmd/goimports
GOBIN="$PWD/.bin" go install google.golang.org/protobuf/cmd/protoc-gen-go


GOBIN="$PWD/.bin" ./.bin/buf generate
./.bin/goimports -w ./bindings/go/scip/scip.pb.go
yarn run prettier

