#!/usr/bin/env bash

set -xeuo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.." # cd to repo root dir

IMAGE_NAME=$(./dev/build-docker-environment.sh)

docker run -it -v $(pwd):/src $IMAGE_NAME 

