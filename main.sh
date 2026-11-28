



bash "$HOME/group_project/create_checksums.sh" "$NEW_BACKUP" || exit 1
bash "$HOME/group_project/verify_backup.sh" "$NEW_BACKUP" || exit 1
