#!/bin/bash
#
# Name:        usb-headset-set-default
# Description: invokes pacmd to set an Audioengine D1 USB DAC as the default
#              audio output device.

# Create a file `/etc/udev/rules.d/91-audioengine-d1.rules
# With the line:
#   ACTION=="add" SUBSYSTEM=="sound" SUBSYSTEMS=="usb" ATTRS{id}=="D1" ATTRS{idVendor}=="1101", ATTRS{idProduct}=="0003", RUN+="/home/jsok/.bin/run-script-in-background /home/jsok/.bin/audioengine-d1-pulse-default-sink.sh"
#
# Reload udev rules with:
#   udevadm control --reload-rules
#
# This will set the default Puse Audio device
#

# Sleep a little to allow PulseAudio to notice the headset
sleep 1

SINK=alsa_card.usb-2010_REV_1.7_Audioengine_D1-00-D1

# Check process table for users running PulseAudio
for user in `ps axc -o user,command | grep pulseaudio | cut -f1 -d' ' | sort | uniq`;
do
    su $user -c "pacmd set-default-sink $(SINK) >/dev/null 2>&amp;1"
done
