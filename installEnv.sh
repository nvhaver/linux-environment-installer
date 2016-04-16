#!/bin/bash
# Complete user environment setup script
# Author: Nick Vam Haver <nvhaver@gmail.com>

# Get distro variables
if [ -f "/etc/arch-release" ]; then
  DISTRIB_ID="Arch"
else
  . /etc/lsb-release
fi

# Prerequisites
case $DISTRIB_ID in
Ubuntu|Debian)
   apt-get install vim vlc firefox zsh wget
   ;;
Arch)
   pacman -S vim vlc firefox zsh wget
   ;;
*)
   echo "Could not detect distribution to install the prerequisite packages, aborting"
   exit
   ;;
esac

# zsh setup
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# Config file to be inserted

# i3wm setup
./i3setup.sh
