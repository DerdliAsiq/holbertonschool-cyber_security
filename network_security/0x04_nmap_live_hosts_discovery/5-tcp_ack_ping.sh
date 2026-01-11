#!/bin/bash
# Nmap kullanarak TCP ACK Ping taraması yapan betik
# -sn: Host keşfi sonrası port taraması yapmaz
# -PA22,80,443: Belirtilen portlar üzerinden TCP ACK paketleri gönderir
sudo nmap -sn -PA22,80,443 "$1"
