#!/bin/bash
# Sync directory to S3
BUCKET=${1:?"Usage: $0 <bucket> [dir]"}
DIR=${2:-.}
echo "Syncing $DIR to s3://$BUCKET..."
aws s3 sync "$DIR" "s3://$BUCKET/" --delete
echo "Sync complete"
