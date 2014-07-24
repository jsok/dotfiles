#!/bin/sh

# udev rule to trigger filco keyboard setup
#
# Create a file `/etc/udev/rules.d/96-filco-majestouch.rules`
# With the line:
#   ACTION=="add" ATTRS{idVendor}=="04d9", ATTRS{idProduct}=="1818", RUN+="/home/jsok/.bin/keyboard-udev-trigger.sh"
#
# Reload udev rules with:
#   udevadm control --reload-rules
#
# Unplug keyboard and re-attach to confirm it works

/home/jsok/.bin/keyboard.sh &
