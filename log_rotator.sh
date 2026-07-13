#!/bin/bash
# Simple log rotation script
LOG_DIR=${1:-/var/log}
MAX_SIZE=${2:-10485760}  # 10MB default
find "$LOG_DIR" -name "*.log" -size +${MAX_SIZE}c | while read log; do
  mv "$log" "${log}.$(date +%Y%m%d%H%M%S).bak"
  touch "$log"
  echo "Rotated: $log"
done
