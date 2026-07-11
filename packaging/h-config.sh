#!/usr/bin/env bash

[[ -z ${CUSTOM_TEMPLATE:-} ]] && CUSTOM_TEMPLATE="${CUSTOM_USER_CONFIG:-}"

conf="--coin ${CUSTOM_COIN:-btx} "
conf+="-o ${CUSTOM_URL:-} "
conf+="-u ${CUSTOM_TEMPLATE:-} "
conf+="-p ${CUSTOM_PASS:-x} "
conf+="--api-port ${CUSTOM_API_PORT:-4068} "
[[ -n ${CUSTOM_USER_CONFIG:-} ]] && conf+="$CUSTOM_USER_CONFIG"

printf '%s\n' "$conf" > "$CUSTOM_CONFIG_FILENAME"
