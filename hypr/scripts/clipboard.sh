#!/bin/bash

config=~/.config/hypr/clipboard.rasi

prompt=Clipboard
[ "$1" == "remove" ] && prompt="Clipboard remove"

pkill -if 'rofi.*clipboard' && exit
sel=$(cliphist list | rofi -dmenu -i -config "$config" -p "$prompt" -matching fuzzy)
[ -z "$sel" ] && exit

if [ "$1" == "remove" ]; then
    echo "$sel" | cliphist delete
    exit
fi

echo "$sel" | cliphist decode | wl-copy
