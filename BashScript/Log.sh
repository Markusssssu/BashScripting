#!/bin/bash

LOG_FILE="/var/log/syslog"
ERROR_KEYWORDS=("ERROR" "CRITICAL")
EMAIL="admin@example.com"

# Функция для отправки уведомления
send_alert() {
    local message=$1
    echo "$message" | mail -s "Log Alert" "$EMAIL"
}

# Мониторинг логов
tail -fn0 "$LOG_FILE" | while read -r line; do
    for keyword in "${ERROR_KEYWORDS[@]}"; do
        if echo "$line" | grep -q "$keyword"; then
            send_alert "Error detected in logs: $line"
        fi
    done
done