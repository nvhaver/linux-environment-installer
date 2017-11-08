#!/bin/bash
#
# Complete user environment setup script
#
# Prerequisites:
# Fresh installed Linux with separate partition called persist
#
# Author: Nick Van Haver <nvhaver@gmail.com>

# References:
# http://blog.self.li/post/74294988486/creating-a-post-installation-script-for-ubuntu
# https://github.com/snwh/ubuntu-post-install/blob/master/ubuntu-post-install-script.sh

. ./lib/generic.sh

sudo-check

# Get distro variables
if [ -f "/etc/arch-release" ]; then
  DISTRIB_ID="Arch"
else
  . /etc/lsb-release
fi

case $DISTRIB_ID in
Arch)
   . ./lib/pacman-install.sh
   ;;
Ubuntu|Debian)
   . ./lib/apt-install.sh
   ;;
*)
   echo "The detected distribution ("$DISTRIB_ID") is not supported, aborting"
   exit 1
   ;;
esac

run-install
install-zsh
#install-node
install-i3
./lib/i3setup.sh
install-coms
set-folder-links

post-install-checks
