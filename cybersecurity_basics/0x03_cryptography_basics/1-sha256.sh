#!/bin/bash
# Verilen argümanı SHA-256 ile hashle ve 1_hash.txt dosyasına kaydet
echo -n "$1" | sha256sum | awk '{print $1}' > 1_hash.txt
