#!/usr/bin/env bash

cd "$(dirname "$0")" || exit 1
. ./h-manifest.conf 2>/dev/null || true

CONF=$(cat "$CUSTOM_CONFIG_FILENAME" 2>/dev/null)
echo "[h-run] ./uminer $CONF"
exec ./uminer $CONF
