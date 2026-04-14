#!/bin/bash
awk '
/Failed/ {for(i=1;i<=NF;i++) if($i=="from") f[$(i+1)]=1}
/Accepted/ {for(i=1;i<=NF;i++) if($i=="from") a[$(i+1)]=1}
END {
    count=0;
    for (ip in a) {
        if (ip in f) count++;
    }
    print count
}' "${1:-auth.log}"
