#!/bin/bash
# Nmap kullanarak ICMP Address Mask taraması yapan betik
# -sn: Port taramasını devre dışı bırakır (Sadece host discovery)
# -PM: ICMP Address Mask Request paketlerini kullanır
sudo nmap -sn -PM "$1"
