#!/bin/bash
sleep 2
DISPLAY=":0.0"
HOME=/home/jsok/
XAUTHORITY=$HOME/.Xauthority
export DISPLAY XAUTHORITY HOME

/usr/bin/setxkbmap -option 'ctrl:nocaps'
/usr/bin/xset r rate 160 50
