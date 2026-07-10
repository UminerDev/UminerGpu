#!/usr/bin/env bash

[[ -z ${CUSTOM_TEMPLATE:-} ]] && CUSTOM_TEMPLATE="${CUSTOM_USER_CONFIG:-}"

conf="--coin btx "
conf+="--pool ${CUSTOM_URL:-} "
conf+="--worker ${CUSTOM_TEMPLATE:-} "
conf+="--api-port ${CUSTOM_API_PORT:-4068} "
[[ -n ${CUSTOM_USER_CONFIG:-} ]] && conf+="$CUSTOM_USER_CONFIG"

printf '%s\n' "$conf" > "$CUSTOM_CONFIG_FILENAME"
