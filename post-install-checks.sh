#!/bin/bash
#
# Post installation checks to verify all software is present

# List of applications to check
programs=(java node npm python3 pip vlc zsh i3wm)

for program in ${programs[@]}; do
    command $program
    if [ $? -ne 0 ]; then
        echo "$program was not installed successfully" 1>&2
    fi
done

