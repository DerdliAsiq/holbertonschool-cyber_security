#!/bin/bash
# Nmap kullanarak UDP Ping taraması yapan betik
# -sn: Host keşfi sonrası port taraması yapmaz
# -PU53,161,162: Belirtilen portlar üzerinden UDP paketleri gönderir
sudo nmap -sn -PU53,161,162 "$1"
