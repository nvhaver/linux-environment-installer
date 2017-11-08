#!/bin/bash
#
# i3 config script
#
# Author: Nick Vam Haver <nvhaver@gmail.com>
# Source: https://www.youtube.com/watch?v=j1I63wGcvU4

# Generate basic config
i3-config-wizard

# Edit the config file (perhaps better copy/github?)
i3folder=.i3
i3conf=$i3folder"/config"

cat <<EOT >> $i3conf

# lock the screen
bindsym \$mod+Shift+x exec i3lock -c 000000

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 20 # decrease screen brightness

# Media player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
EOT

# Install playerctl
playerctlSetup=/tmp/pctl.deb
wget -O $playerctlSetup https://github.com/acrisci/playerctl/releases/download/v0.4.2/playerctl-0.4.2_amd64.deb
dpkg -i $playerctlSetup 
rm $playerctlSetup

# Install font awesome
awesomeZip=/tmp/awesome.zip
wget -O $awesomeZip https://github.com/FortAwesome/Font-Awesome/archive/v4.5.0.zip
unzip $awesomeZip
mkdir .fonts
mv Font-Awesome-4.5.0/fonts/fontawesome-webfont.ttf .fonts

rm /tmp/awesome.zip
rm -r Font-Awesome-4.5.0
