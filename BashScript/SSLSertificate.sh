#!/bin/bash
domain="example.com"
openssl x509 -enddate -noout -in <(openssl s_client -connect "$domain":443 2>/dev/null)