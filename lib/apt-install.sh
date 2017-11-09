#!/bin/bash
#
#  Apt installation functions
#
# Prerequisites:
# Fresh installed Ubuntu Linux with separate partition called persist
#
# Author: Nick Van Haver <nvhaver@gmail.com>

function run-install {
    purge-bloat
    upgrade-system
    install-systools
    install-multimedia
    install-browsers
    install-devtools
    install-java
    install-node
    install-python
    install-i3
}

# Purge bloatware
function purge-bloat {
    apt-get -y purge account-plugin-facebook account-plugin-flickr aisleriot brltty colord deja-dup evolution-data-server-online-accounts example-content gnome-accessibility-themes gnome-mahjongg gnome-mines gnome-orca gnome-screensaver gnome-sudoku gnome-video-effects libreoffice-avmedia-backend-gstreamer libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core libreoffice-draw libreoffice-gnome libreoffice-gtk libreoffice-impress libreoffice-math libreoffice-ogltrans libreoffice-pdfimport libreoffice-style-galaxy libreoffice-writer libsane libsane-common python3-uno rhythmbox rhythmbox-plugins rhythmbox-plugin-zeitgeist sane-utils shotwell shotwell-common thunderbird thunderbird-gnome-support totem totem-common totem-plugins unity-scope-chromiumbookmarks unity-scope-colourlovers unity-scope-devhelp unity-scope-firefoxbookmarks unity-scope-gdrive unity-scope-manpages unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote unity-scope-virtualbox unity-scope-yelp unity-scope-zotero unity-webapps-common
}

# Add package repositories and upgrade system
function upgrade-system {
    # Add package repositories for Java
    add-apt-repository -y ppa:webupd8team/java

    # Enable source code package repositories
    sed 's/# deb-s/deb-s/' -i /etc/apt/sources.list
    sed 's/# deb h/deb h/' -i /etc/apt/sources.list

    apt-get update
    apt-get dist-upgrade -y
}

## Installers Other software
function install-systools {
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
    apt-get install -y curl zsh htop wget virtualbox ubuntu-restricted-extras synergy keepass2 
#wireshark mono tor apache2 nginx mysql php libapache2-mod-php php-mcrypt php-mysql php-cli php-fpm ntfs-3g gimp ffmpeg espeak
}

function install-multimedia {
    apt-get install -y vlc youtube-dl deluge
}

function install-browsers {
    apt-get install -y chromium-browser firefox
}

## Installers Programming software
function install-devtools {
    apt-get install -y build-essential git vim
}

function install-java {
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
    #apt-get install oracle-java7-installer
    #apt-get install oracle-java8-installer
    apt-get install -y oracle-java9-installer
    apt-get install -y oracle-java9-set-default
}

function install-npm {
    apt-get install -y nodejs npm 
}

function install-python {
    apt-get install -y python-pip
}

function install-i3 {
    apt-get install -y i3 i3blocks lxappearance thunar gnome-icon-theme-full fonts-font-awesome
}
