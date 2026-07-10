#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
POOL="${POOL:-}"
WALLET="${WALLET:-}"
WORKER="${WORKER:-$(hostname)}"
PASS="${PASS:-x}"

if [[ -z "$POOL" || -z "$WALLET" ]]; then
    echo "Set POOL and WALLET before starting:" >&2
    echo "  POOL=host:port WALLET=btx1... WORKER=rig1 ./start.sh" >&2
    exit 2
fi

exec "$ROOT/uminer" \
    --coin btx \
    -o "$POOL" \
    -u "$WALLET.$WORKER" \
    -p "$PASS" \
    "$@"
