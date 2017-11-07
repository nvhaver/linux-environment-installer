#!/bin/bash
#
# Ubuntu setup script
#
# Prerequisites:
# Fresh installed Ubuntu Linux with separate partition called persist
#
# Author: Nick Van Haver <nvhaver@gmail.com>

# Check if user has root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root" 1>&2
  exit 1
fi

. ./lib/ubuntu.sh

purge-bloat
upgrade-system

install-systools
install-multimedia
install-browsers
install-coms

install-devtools
install-java
install-node
install-python
