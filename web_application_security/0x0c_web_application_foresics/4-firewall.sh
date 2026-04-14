#!/bin/bash
grep -c "COMMAND=/sbin/iptables" "${1:-auth.log}"
