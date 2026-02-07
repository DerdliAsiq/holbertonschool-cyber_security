#!/bin/bash
hashcat -m 0 -a 0 "$1" /usr/share/wordlists/rockyou.txt --quiet --force --show | cut -d':' -f2 > 7-password.txt
