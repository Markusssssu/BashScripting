#!/bin/bash
usage=$(df / | grep / | awk '{print $5}' | sed 's/%//g')
if [ "$usage" -gt 90 ]; then
    echo "Disk usage is over 90%!" | mail -s "Disk Alert" user@example.com
fi