#!/usr/bin/env bash

set -euo pipefail

{
if [ -z "${NEW_VERSION:-}" ]; then
  echo "error: Missing value for environment variable NEW_VERSION"
  echo "hint: Invoke this script as NEW_VERSION=M.N.P ./tools/scripts/publish-release.sh"
  exit 1
fi

if ! grep -q "## v$NEW_VERSION" CHANGELOG.md; then
  echo "error: Missing CHANGELOG entry for v$NEW_VERSION"
  echo "note: CHANGELOG entries are required for publishing releases"
  exit 1
fi

if ! grep -q "$NEW_VERSION" cmd/scip/version.txt; then
  echo "error: SCIP version in cmd/scip/version.txt doesn't match NEW_VERSION=$NEW_VERSION"
  exit 1
fi

if ! git diff --quiet; then
  echo "error: Found unstaged changes; aborting."
  exit 1
fi

if ! git diff --quiet --cached; then
  echo "error: Found staged-but-uncommitted changes; aborting."
  exit 1
fi

if ! git rev-parse --abbrev-ref HEAD | grep -q "main"; then
  echo "error: Releases should be published from main but HEAD is on a different branch" >&2
  exit 1
fi
} >&2

TAG="v$NEW_VERSION"
git tag "$TAG"
git push origin "$TAG"

{
  echo "See the [CHANGELOG](https://github.com/sourcegraph/scip/blob/main/CHANGELOG.md) to see what's new in scip v$NEW_VERSION."
  echo ''
  echo 'Download the CLI for your current platform using:'
  echo ''
  echo '```bash'
  echo 'env \'
  echo "  TAG=\"v$NEW_VERSION\" \\"
  echo '  OS="$(uname -s | tr '\''[:upper:]'\'' '\''[:lower:]'\'')" \'
  echo '  ARCH="$(uname -m | sed -e '\''s/x86_64/amd64/'\'')" \'
  echo '  bash -c '\''curl -L "https://github.com/sourcegraph/scip/releases/download/$TAG/scip-$OS-$ARCH.tar.gz"'\'' \'
  echo '| tar xzf - scip'
  echo '```'
} | gh release create "$TAG" --title "scip v$NEW_VERSION" --notes-file -
