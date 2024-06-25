#!/usr/bin/env bash

set -xeuo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.." # cd to repo root dir

IMAGE_NAME="sourcegraph/scip-bindings-env"

docker build . -t $IMAGE_NAME -f Dockerfile.bindings
docker run -v $(pwd):/src $IMAGE_NAME
