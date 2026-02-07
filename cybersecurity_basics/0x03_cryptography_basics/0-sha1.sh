#!/bin/bash
# Verilen argümanı SHA-1 ile hashle ve 0_hash.txt dosyasına kaydet
echo -n "$1" | sha1sum | awk '{print $1}' > 0_hash.txt
