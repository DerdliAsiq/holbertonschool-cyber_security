#!/bin/bash
grep -v -E "^#|^$" /etc/ssh/sshd_config
