#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "usage: $0 /path/to/uminer" >&2
    exit 2
fi

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BINARY="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
DIST="$ROOT/dist"
STAGE="$DIST/uminer"
ARCHIVE="$DIST/uminer-linux-x86_64-cuda13.tar.gz"

test -x "$BINARY"
file "$BINARY" | grep -q 'ELF 64-bit LSB.*x86-64'
"$BINARY" --version | grep -q '^uminer 0.1.3$'
"$BINARY" --help | grep -q -- '--coin <COIN>'
"$BINARY" --help | grep -q -- '--pool <POOL>'
"$BINARY" --help | grep -q -- '--user <USER>'

rm -rf "$STAGE"
mkdir -p "$STAGE"
install -m 0755 "$BINARY" "$STAGE/uminer"
install -m 0755 "$ROOT/packaging/start.sh" "$STAGE/start.sh"
install -m 0755 "$ROOT/packaging/h-config.sh" "$STAGE/h-config.sh"
install -m 0755 "$ROOT/packaging/h-run.sh" "$STAGE/h-run.sh"
install -m 0755 "$ROOT/packaging/h-stats.sh" "$STAGE/h-stats.sh"
install -m 0644 "$ROOT/packaging/h-manifest.conf" "$STAGE/h-manifest.conf"
install -m 0644 "$ROOT/packaging/config.example.json" "$STAGE/config.example.json"
install -m 0644 "$ROOT/README.md" "$STAGE/README.md"

(
    cd "$STAGE"
    sha256sum uminer > SHA256SUMS
)

tar -czf "$ARCHIVE" -C "$DIST" uminer
(
    cd "$DIST"
    sha256sum "$(basename "$ARCHIVE")" > SHA256SUMS
)

echo "Created $ARCHIVE"
cat "$DIST/SHA256SUMS"
