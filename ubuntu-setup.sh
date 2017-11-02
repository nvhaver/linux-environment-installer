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

# Add package repositories
add-apt-repository -y ppa:webupd8team/java

# Enable source code package repositories
sed 's/# deb/deb/' -i /etc/apt/sources.list

# Update system packages
apt-get update
apt-get dist upgrade -y

# Install additional software
apt-get -y build-essential install zsh wget vim git chromium-browser firefox virtualbox virtualbox-guest-x11 htop deluge ubuntu-restricted-extras vlc youtube-dl

# Java JDK
#apt-get install oracle-java7-installer
#apt-get install oracle-java8-installer
apt-get install -y oracle-java9-installer
apt-get install -y oracle-java9-set-default

# NodeJs - TO CHECK
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#apt-get install -y nodejs

# Purge not needed software
#apt-get purge
