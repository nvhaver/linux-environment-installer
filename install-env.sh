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

# Check if user has root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root" 1>&2
  exit 1
fi

# Get distro variables
if [ -f "/etc/arch-release" ]; then
  DISTRIB_ID="Arch"
else
  . /etc/lsb-release
fi

# Prerequisites
case $DISTRIB_ID in
Arch)
   pacman -S vim vlc firefox zsh wget
   ;;
Ubuntu|Debian)
   ./ubuntu-setup.sh
   ;;
*)
   echo "Could not detect distribution to install the prerequisite packages, aborting"
   exit
   ;;
esac

# Symlinking home folders to persistent location
cd /persist/
mkdir Desktop/ Downloads/ Pictures/ Videos/ Music/ Templates/ Documents/ Development/
cd
rm -rf Desktop/ Downloads/ Pictures/ Videos/ Public/ Music/ Templates/ Documents/
ln -s /persist/Desktop/     Desktop
ln -s /persist/Development/ Development
ln -s /persist/Documents/   Documents
ln -s /persist/Downloads/   Downloads
ln -s /persist/Pictures/    Pictures
ln -s /persist/Templates/   Templates
ln -s /persist/Videos       Videos

# Copy fonts
cp ./fonts/* ~/.fonts

# Copy password database
#cp PDB_NVH_*.kdbx ~/Private

# Zsh setup
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Config file to be inserted

# I3wm setup
./i3setup.sh

./post-install-checks.sh
