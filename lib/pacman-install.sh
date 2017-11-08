#!/bin/bash
#
# Pacman installation functions
#
# Prerequisites:
# Fresh installed Arch Linux with separate partition called persist
#
# Author: Nick Van Haver <nvhaver@gmail.com>

function run-install {
    pacman -S vim vlc firefox zsh wget
    install-i3
}

function install-i3 {
    pacman -S i3 i3blocks lxappearance thunar gnome-icon-theme-full fonts-font-awesome
}
