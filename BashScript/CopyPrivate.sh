#!/bin/bash

SOURCE_DIR="/home/user/data"
BACKUP_DIR="/backups"
REMOTE_USER="user"
REMOTE_HOST="backup.example.com"
REMOTE_DIR="/remote/backups"
ENCRYPTION_KEY="mysecretkey"

# Создание резервной копии
backup_file="$BACKUP_DIR/backup_$(date +%Y%m%d).tar.gz"
tar -czf - "$SOURCE_DIR" | openssl enc -aes-256-cbc -salt -pass pass:"$ENCRYPTION_KEY" -out "$backup_file"

# Отправка на удаленный сервер
scp "$backup_file" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Удаление локальной копии
rm "$backup_file"

echo "Backup completed and sent to remote server."