#!/bin/bash

set -e

SYMBOL="BTCUSDT"
INTERVAL="30m"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$SCRIPT_DIR/.."
DATA_DIR="$BASE_DIR/data"
LOG_DIR="$BASE_DIR/logs"

mkdir -p "$DATA_DIR"
mkdir -p "$LOG_DIR"

echo "Starting crypto fetcher service..."

while true; do
  TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")

curl -s "https://api.binance.com/api/v3/klines?symbol=$SYMBOL&interval=$INTERVAL&limit=100" \
  > "$DATA_DIR/${SYMBOL}_${TIMESTAMP}.json"

if [ $? -eq 0 ]; then
  echo "[$(date)] SUCCESS: Downloaded $SYMBOL" >> "$LOG_DIR/fetch.log"
else
  echo "[$(date)] ERROR: Download failed" >> "$LOG_DIR/fetch.log"
fi
  sleep 1800
done  