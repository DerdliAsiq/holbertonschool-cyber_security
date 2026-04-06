#!/bin/bash
awk '{print $1}' logs.txt | sort | uniq -c | sort -nr | head -n 1 | awk '{print $1}'#!/bin/bash
awk '{print $1}' $1 | sort | uniq -c | sort -nr | head -n 1 | awk '{print $1}'
