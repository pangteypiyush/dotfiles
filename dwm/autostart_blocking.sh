#!/bin/bash

export _JAVA_AWT_WM_NONREPARENTING=1

compton -b

feh --bg-scale ~/.dwm/wall.jpg

# 50% Volume on startup
amixer set Master 50%

# mouse configuration
MOUSE=`xinput | grep Mouse | sed 's/^.*id=\([0-9]\+\).*$/\1/g'`
xinput --set-prop $MOUSE 'libinput Accel Speed' -0.45
xinput --set-prop $MOUSE 'libinput Accel Profile Enabled' 0 1

# keyboard configuration
#setxkbmap -option keypad:pointerkeys 

# status
slstatus &
