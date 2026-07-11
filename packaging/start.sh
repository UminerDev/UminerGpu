#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
POOL="${POOL:-}"
WALLET="${WALLET:-}"
WORKER="${WORKER:-$(hostname)}"
PASS="${PASS:-x}"
COIN="${COIN:-btx}"

if [[ -z "$POOL" || -z "$WALLET" ]]; then
    echo "Set POOL and WALLET before starting:" >&2
    echo "  COIN=btx POOL=host:port WALLET=btx1... WORKER=rig1 ./start.sh" >&2
    exit 2
fi

exec "$ROOT/uminer" \
    --coin "$COIN" \
    -o "$POOL" \
    -u "$WALLET.$WORKER" \
    -p "$PASS" \
    "$@"
