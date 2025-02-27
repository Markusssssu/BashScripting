#!/bin/bash
for file in /path/to/dir/*; do
    gzip "$file"
done
echo "Files compressed!"