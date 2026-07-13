#!/bin/bash
# Monitor disk usage and alert on threshold
THRESHOLD=${1:-80}
df -H | grep -vE "^Filesystem|tmpfs|cdrom" | awk "{ print $5 \" \" $1 }" | while read output; do
  usage=$(echo "$output" | awk "{ print $1}" | cut -d"%" -f1)
  partition=$(echo "$output" | awk "{ print $2 }")
  if [ $usage -ge $THRESHOLD ]; then
    echo "Warning: $partition is ${usage}% full"
  fi
done
