#!/bin/bash
#
# Post installation checks to verify all software is present

# List of applications to check
programs=(java nodejs npm python3 pip vlc zsh i3 vim)

for program in ${programs[@]}; do
    command -v $program >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "$program was not installed successfully" 1>&2
    fi
done

