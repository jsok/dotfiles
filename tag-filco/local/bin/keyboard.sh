#!/bin/bash

# udev rule to trigger filco keyboard setup
#
# Create a file `/etc/udev/rules.d/96-filco-majestouch.rules`
# With the line:
#   ACTION=="add" ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="1818", RUN+="/home/jsok/.local/bin/run-script-in-background /home/jsok/.bin/keyboard.sh"
#
# Reload udev rules with:
#   udevadm control --reload-rules
#
# Unplug keyboard and re-attach to confirm it works

sleep 2
DISPLAY=":0.0"
HOME=/home/jsok/
XAUTHORITY=$HOME/.Xauthority
export DISPLAY XAUTHORITY HOME

/usr/bin/setxkbmap -option 'ctrl:nocaps'
/usr/bin/xset r rate 160 50
