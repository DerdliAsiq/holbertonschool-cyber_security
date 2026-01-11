#!/bin/bash
# Nmap kullanarak ICMP Timestamp taraması yapan betik
# -sn: Port taramasını devre dışı bırakır
# -PP: ICMP Timestamp Request paketlerini kullanır
sudo nmap -sn -PP "$1"
