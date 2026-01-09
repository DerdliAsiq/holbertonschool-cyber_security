#!/bin/bash
whois $1 | awk -F': +' '/^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone|Fax|Email)/ {k=$1; v=$2; if (k ~ /Street/) v=v" "; if (k ~ /Ext/) k=k":"; printf "%s,%s%s", k, v, (NR == 500 ? "" : "\n")}' | sed '/^$/d' | printf "%s" "$(cat)" > $1.csv
