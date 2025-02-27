#!/bin/bash

SERVERS=("server1.example.com" "server2.example.com" "server3.example.com")
EMAIL="admin@example.com"
REPORT_FILE="/tmp/network_report.txt"

# Очистка файла отчета
> "$REPORT_FILE"

# Проверка доступности серверов
for server in "${SERVERS[@]}"; do
    if ping -c 1 "$server" &> /dev/null; then
        echo "$server is UP" >> "$REPORT_FILE"
    else
        echo "$server is DOWN" >> "$REPORT_FILE"
    fi
done

# Отправка отчета
mail -s "Network Status Report" "$EMAIL" < "$REPORT_FILE"
echo "Report sent to $EMAIL."