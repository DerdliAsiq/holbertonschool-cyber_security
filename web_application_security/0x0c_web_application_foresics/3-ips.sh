#!/bin/bash
grep "Accepted" "${1:-auth.log}" | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort -u | wc -l
