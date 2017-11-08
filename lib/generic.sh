#!/bin/bash
#
# Generic linux functions

# Check if user has root privileges
function sudo-check {
    if [ "$EUID" -ne 0 ]; then
        echo "Please run as root" 1>&2
        exit 1
    fi
}

function set-folder-links {
    # Symlinking home folders to persistent location
    if [ -d /persist/ ]; then
        cd /persist/
        mkdir Desktop/ Downloads/ Pictures/ Videos/ Music/ Templates/ Documents/ Development/
        cd -   

        cd

        rm -rf Desktop/ Downloads/ Pictures/ Videos/ Public/ Music/ Templates/ Documents/
        ln -s /persist/Desktop/     Desktop
        ln -s /persist/Development/ Development
        ln -s /persist/Documents/   Documents
        ln -s /persist/Downloads/   Downloads
        ln -s /persist/Pictures/    Pictures
        ln -s /persist/Templates/   Templates
        ln -s /persist/Videos       Videos   
        cd -
    
        # Copy fonts
        cp ./fonts/* ~/.fonts

        # Copy password database
        #cp PDB_NVH_*.kdbx ~/Private
    fi
}

# Install communication tools
function install-coms {
    # Teamspeak
    cd /opt
    # Get latest version
    curl -sL http://dl.4players.de/ts/releases/3.1.6/TeamSpeak3-Client-linux_amd64-3.1.6.run
    chmod u+x TeamSpeak3-Client-linux_amd64-3.1.6.run
    # Run installer
    ./TeamSpeak3-Client-linux_amd64-3.1.6.run
    # cleanup
    rm TeamSpeak3-Client-linux_amd64-3.1.6.run
    cd -
    #ln -S /opt/TeamSpeak3-Client-linux_amd64-3.1.6/ /usr/bin/teamspeak3
}

# NodeJs
function install-node {
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
}

function install-zsh {
    # Zsh setup
    #chsh -s $(which zsh)
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    # Set Zsh theme
    sed -ir 's/ZSH_THEME=".*"/ZSH_THEME="bira"/' .zshrc
}

function install-i3 {
    # Copy config file
    ./i3setup.sh
}

function post-install-checks {
    # List of applications to check
    programs=(java nodejs npm python3 pip vlc zsh i3 vim virtualbox teamspeak3)

    for program in ${programs[@]}; do
        command -v $program >/dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo "$program was not installed successfully" 1>&2
        fi  
    done
}

