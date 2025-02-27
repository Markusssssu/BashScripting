#!/bin/bash

LOG_DIR="/var/log/myapp"
BACKUP_DIR="/var/log/myapp/backup"
RETENTION_DAYS=30

# Создание директории для резервных копий
mkdir -p "$BACKUP_DIR"

# Архивирование логов
for logfile in "$LOG_DIR"/*.log; do
    if [ -f "$logfile" ]; then
        filename=$(basename "$logfile")
        backup_file="$BACKUP_DIR/${filename%.log}_$(date +%Y%m%d).tar.gz"
        tar -czf "$backup_file" "$logfile"
        rm "$logfile"
        echo "Archived $logfile to $backup_file"
    fi
done

# Удаление старых архивов
find "$BACKUP_DIR" -type f -mtime +$RETENTION_DAYS -exec rm {} \;
echo "Old backups older than $RETENTION_DAYS days deleted."