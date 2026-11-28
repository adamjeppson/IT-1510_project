#!/bin/bash

BACKUP_DIR="$HOME/group_project/sample_backup"

# Verify that the backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: backup directory does not exist"
    exit 1
fi

echo "Starting checksum verification for $BACKUP_DIR"

cd "$BACKUP_DIR"

if sha256sum --check checksums.sha256; then
    echo "Checksum verification successful"
    exit 0
else
    echo "Checksum verification failed"
    exit 1
fi