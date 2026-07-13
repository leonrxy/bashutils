#!/bin/bash
# Advanced file finding utilities
# Enhanced wrappers around find and locate

find_by_size() {
  local dir="${1:-.}" min="${2:-+0}" max="${3:-}"
  if [ -n "$max" ]; then
    find "$dir" -type f -size +"$min"c -size -"${max}"c 2>/dev/null
  else
    find "$dir" -type f -size +"$min"c 2>/dev/null
  fi
}

find_recent() {
  local dir="${1:-.}" minutes="${2:-60}"
  find "$dir" -type f -mmin -"$minutes" 2>/dev/null
}

find_by_ext() {
  local dir="${1:-.}" ext="$2"
  find "$dir" -type f -name "*.$ext" 2>/dev/null
}

find_empty() {
  local dir="${1:-.}"
  find "$dir" -type f -empty 2>/dev/null
}

find_duplicates() {
  local dir="${1:-.}"
  find "$dir" -type f -exec md5sum {} + 2>/dev/null | sort | uniq -w32 -dD
}

find_large_files() {
  local dir="${1:-.}" size="${2:-100M}"
  find "$dir" -type f -size +"$size" -exec ls -lh {} + 2>/dev/null | awk "{print \$5, \$NF}" | sort -rh
}