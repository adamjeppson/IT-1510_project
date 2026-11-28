#!/bin/bash

BACKUP_DIR="$HOME/group_project/sample_backup"
MANIFEST_NAME="checksums.sha256"

# Confirm that the backup directory exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: backup directory does not exist"
    exit 1
fi

echo "Starting checksum creation for $BACKUP_DIR"

# Remove the newest backup's old manifest before creating a fresh one.
# This prevents modifying a manifest that may be hard-linked to an older backup.
rm -f "$BACKUP_DIR/$MANIFEST_NAME"

# Enter the backup directory
if ! cd "$BACKUP_DIR"; then
    echo "Error: could not enter the backup directory"
    exit 1
fi

# Calculate checksums for all regular files except the manifest itself
if find . -type f ! -name "$MANIFEST_NAME" -exec sha256sum {} + > "$MANIFEST_NAME"; then
    echo "Checksum created successfully"
    exit 0
else
    echo "Error: checksum creation failed"
    rm -f "$MANIFEST_NAME"
    exit 1
fi