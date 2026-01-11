#!/bin/bash
# Nmap kullanarak ICMP Echo (Ping) taraması yapan betik
# -sn: Port taramasını atla (sadece host discovery)
# -PE: ICMP Echo Request paketlerini kullan
sudo nmap -sn -PE "$1"
