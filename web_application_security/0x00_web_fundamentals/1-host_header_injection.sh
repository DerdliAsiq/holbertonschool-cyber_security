#!/bin/bash
curl -s -H "Host: $1" "$2" -d "$3"
