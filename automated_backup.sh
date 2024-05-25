#!/bin/bash

# Prompt the user for input
read -p "Enter the files/directories to backup (separated by space): " files_to_backup
read -p "Enter the destination directory for backups: " backup_dest

# Create timestamp
timestamp=$(date +"%Y-%m-%d")

# Create backup filename
backup_file="backup_$timestamp.tar.gz"

# Perform backup
tar -czf "$backup_dest/$backup_file" $files_to_backup

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $backup_file" >> backup.log
    # Rotation - Delete old backups
    find "$backup_dest" -name 'backup_*.tar.gz' -mtime +7 -exec rm {} \;
    echo "Old backups deleted."
    # Notification (replace with your email sending logic)
    echo "Backup completed successfully. Check $backup_dest for details." | mail -s "Backup Status" user@example.com
else
    echo "Backup failed. Check logs for details." >> backup.log
fi
