#!/bin/bash
find /path/to/dir -type f -exec md5sum {} + | sort | uniq -w32 -dD