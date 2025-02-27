#!/bin/bash
server="example.com"
ping -c 1 "$server" > /dev/null && echo "Server is up!" || echo "Server is down!"