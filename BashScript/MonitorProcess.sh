#!/bin/bash
process=$(ps aux --sort=-%cpu | head -n 2 | tail -n 1 | awk '{print $2}')
kill -9 "$process"
echo "Process $process killed!"