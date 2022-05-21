[![CI](https://github.com/donsbot/if-proto-scip-hs/actions/workflows/ci.yml/badge.svg)](https://github.com/donsbot/if-proto-scip-hs/actions/workflows/ci.yml)

# Haskell bindings for SCIP

These bindings use Google's proto-lens generator for Haskell. More details at:

https://github.com/google/proto-lens#readme

Building: see the following workflow file for most up to date:
https://github.com/donsbot/if-proto-scip-hs/blob/main/.github/workflows/ci.yml

First, get a working GHC environment:

```sh
# Linux
GHCUPVERSION=0.1.17.4
curl --proto '=https' --tlsv1.2 -sSf https://downloads.haskell.org/~ghcup/$GHCUPVERSION/x86_64-linux-ghcup-$GHCUPVERSION > /usr/bin/ghcup && \
chmod +x /usr/bin/ghcup
ghcup install ghc 8.10.7 --set
ghcup install cabal 3.6.0.0 --set
```

```sh
# macOS
GHCUPVERSION=0.1.17.4
curl --proto '=https' --tlsv1.2 -sSf https://downloads.haskell.org/~ghcup/$GHCUPVERSION/x86_64-apple-darwin-ghcup-$GHCUPVERSION > /usr/local/bin/ghcup && \
chmod +x /usr/local/bin/ghcup
ghcup install ghc 8.10.7 --set
ghcup install cabal 3.6.0.0 --set
```

Next, install Google's `protoc` compiler. See: https://github.com/google/proto-lens/blob/master/docs/installing-protoc.md

Then install the haskell generator from the proto-lens packages:

```
cabal install proto-lens-protoc
```

Finally, generate the source files manually in `src/*`

```sh
# working directory: bindings/haskell
protoc --plugin=protoc-gen-haskell=`which proto-lens-protoc` --haskell_out=src --proto_path=../.. scip.proto
```

Build the library as normal:

```
# working directory: bindings/haskell
cabal build
```
