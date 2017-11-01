#!/bin/bash
#
# Ubuntu setup script
#
# Prerequisites:
# Fresh installed Ubuntu Linux with separate partition called persist
#
# Author: Nick Van Haver <nvhaver@gmail.com>

# Add package repositories
add-apt-repository ppa:webupd8team/java

# Enable source code package repositories
sed 's/# deb/deb/' -i /etc/apt/sources.list

# Update system packages
apt-get update
apt-get dist upgrade -y

# Install additional software
apt-get -y build-essential install zsh wget vim git chromium-browser firefox vlc youtube-dl virtualbox virtualbox-guest-x11 htop deluge

# Java JDK
#apt-get install oracle-java7-installer
#apt-get install oracle-java8-installer
apt-get install oracle-java9-installer
#apt-get install oracle-java9-set-default

# NodeJs - TO CHECK
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#apt-get install -y nodejs


