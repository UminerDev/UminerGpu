#!/usr/bin/env bash

API="127.0.0.1:${CUSTOM_API_PORT:-4068}"
RESP=$(curl -s --max-time 5 "http://$API/stats" 2>/dev/null)

if [[ -z "$RESP" ]]; then
    khs=0
    stats='{"hs":[],"hs_units":"hs","temp":[],"fan":[],"uptime":0,"ver":"'"${CUSTOM_VERSION:-0.1.1}"'","ar":[0,0],"algo":"btx"}'
    echo "$khs"
    echo "$stats"
    exit 0
fi

total_hs=$(echo "$RESP" | jq -r '.total_hs // 0')
khs=$(awk "BEGIN{printf \"%.3f\", $total_hs/1000}")
hs=$(echo "$RESP" | jq -c '[.gpus[].hs]')
temp=$(echo "$RESP" | jq -c '[.gpus[].temp]')
fan=$(echo "$RESP" | jq -c '[.gpus[].fan]')
uptime=$(echo "$RESP" | jq -r '.uptime // 0')
acc=$(echo "$RESP" | jq -r '.shares.accepted // 0')
rej=$(echo "$RESP" | jq -r '(.shares.rejected // 0) + (.shares.stale // 0)')

stats=$(jq -nc \
    --argjson hs "$hs" --argjson temp "$temp" --argjson fan "$fan" \
    --argjson uptime "$uptime" --argjson acc "$acc" --argjson rej "$rej" \
    --arg ver "${CUSTOM_VERSION:-0.1.1}" \
    '{hs:$hs,hs_units:"hs",temp:$temp,fan:$fan,uptime:$uptime,ver:$ver,ar:[$acc,$rej],algo:"btx"}')

echo "$khs"
echo "$stats"
