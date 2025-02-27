#!/bin/bash
find /tmp -type f -mtime +7 -exec rm {} \;
echo "Temporary files cleaned!"