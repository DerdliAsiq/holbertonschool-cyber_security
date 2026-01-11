#!/bin/bash
# Nmap kullanarak ARP taraması yapan betik
# -sn: Port taramasını devre dışı bırakır (Host Discovery only)
# -PR: ARP taraması (ARP Ping) yapılmasını sağlar
sudo nmap -sn -PR "$1"
