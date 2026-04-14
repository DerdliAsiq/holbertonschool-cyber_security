#!/bin/bash
grep "Accepted" "${1:-auth.log}" | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | sort -u | wc -l
