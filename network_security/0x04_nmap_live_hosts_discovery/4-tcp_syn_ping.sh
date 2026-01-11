#!/bin/bash
# Nmap kullanarak TCP SYN Ping taraması yapan betik
# -sn: Host discovery sonrası port taraması yapmaz
# -PS22,80,443: Belirtilen portlar üzerinden TCP SYN paketleri gönderir
sudo nmap -sn -PS22,80,443 "$1"
