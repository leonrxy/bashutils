#!/bin/bash
# Backup environment variables
BACKUP_FILE="${HOME}/.env_backup_$(date +%Y%m%d).txt"
env | sort > "$BACKUP_FILE"
echo "Environment saved to $BACKUP_FILE ($(wc -l < "$BACKUP_FILE") vars)"
