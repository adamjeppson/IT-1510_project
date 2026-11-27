BACKUP_ROOT="/var/backups/my_app"
SRC_SPEC="root@127.0.0.1:/path/to/source_dir/"   # Loopback SSH target
LOG_TAG="my_backup_job"                          # Custom topic for journalctl -t
DEST_DIR="${BACKUP_ROOT}/backup0"
PREV_DIR="${BACKUP_ROOT}/backup1"
OLDEST_DIR="${BACKUP_ROOT}/backup9"
RSYNC_LOG="${DEST_DIR}/rsync_backup.txt"
MANIFEST="${DEST_DIR}/manifest.sha256"

#task B
if [ -d "$PREV_DIR" ]; then    
cp -al "$PREV_DIR" "$DEST_DIR"
else    
mkdir -p "$DEST_DIR"
fi
# --- Task C: Remote backup over SSH using rsync + --delete + file log --
date "+Start Time: %Y-%m-%d %H:%M:%S" > "$RSYNC_LOG"
 
rsync -av -e "ssh" --delete "$SRC_SPEC" "$DEST_DIR/" >> "$RSYNC_LOG"
 
date "+End Time: %Y-%m-%d %H:%M:%S" >> "$RSYNC_LOG"