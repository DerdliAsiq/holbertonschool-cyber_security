#!/bin/bash
sestatus 2>/dev/null | grep "SELinux status:" || echo "SELinux status: disabled"
