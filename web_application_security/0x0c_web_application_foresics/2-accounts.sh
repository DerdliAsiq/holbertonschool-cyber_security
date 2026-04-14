#!/bin/bash
awk '/Failed/ {failed[$9]++} /Accepted/ {if (failed[$9] > 0) print $9}' "${1:-auth.log}" | sort -u | head -n 1
