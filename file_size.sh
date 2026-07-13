#!/bin/bash
# Display file sizes in human-readable format
# Usage: ./file_size.sh [directory]

dir="${1:-.}"
find "$dir" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -20
