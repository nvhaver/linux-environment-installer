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
apt-get -y build-essential install zsh wget vim git chromium-browser firefox virtualbox virtualbox-guest-x11 htop deluge ubuntu-restricted-extras vlc youtube-dl synergy keepass2 

# Java JDK
#apt-get install oracle-java7-installer
#apt-get install oracle-java8-installer
apt-get install -y oracle-java9-installer
apt-get install -y oracle-java9-set-default

# NodeJs - TO CHECK
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#apt-get install -y nodejs

# Purge not needed software
apt-get purge account-plugin-aim account-plugin-facebook account-plugin-flickr account-plugin-jabber account-plugin-salut account-plugin-twitter account-plugin-windows-live account-plugin-yahoo aisleriot brltty colord deja-dup deja-dup-backend-gvfs duplicity empathy empathy-common evolution-data-server-online-accounts example-content gnome-accessibility-themes gnome-contacts gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects gnomine landscape-common libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-presentation-minimizer libreoffice-style-galaxy libreoffice-style-human libreoffice-writer libsane libsane-common mcp-account-manager-uoa python3-uno rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common telepathy-gabble telepathy-haze telepathy-idle telepathy-indicator telepathy-logger telepathy-mission-control-5 telepathy-salut thunderbird thunderbird-gnome-support totem totem-common totem-plugins unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-colourlovers unity-scope-devhelp unity-scope-firefoxbookmarks unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-manpages unity-scope-musicstores unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-virtualbox unity-scope-yelp unity-scope-zotero
