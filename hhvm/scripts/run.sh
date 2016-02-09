#!/bin/sh

STAMP=$(date)

if [ ! -f /app/index.php ]; then
  echo "[${STAMP}] Installing wordpress..."
  cp -vfr /wordpress/* /app/
fi

echo "[${STAMP}] Starting daemon..."
# run hhvm server daemon
hhvm --mode=server
