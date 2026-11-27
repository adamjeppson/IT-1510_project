#!/bin/bash

BACKUP_ROOT="$HOME/backup-project-test"

# Delete the oldest backup
rm -rf "$BACKUP_ROOT/backup9"

# Shift backups from 8 down to 0
for i in {8..0}; do
    if [ -d "$BACKUP_ROOT/backup$i" ]; then
        mv "$BACKUP_ROOT/backup$i" "$BACKUP_ROOT/backup$((i+1))"
    fi
done
