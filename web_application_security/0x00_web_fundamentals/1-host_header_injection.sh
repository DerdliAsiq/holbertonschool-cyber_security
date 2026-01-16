#!/bin/bash
curl -s -H -X "Host: $1" "$2" -d "$3"
