#!/bin/bash

config=~/.config/hypr/hyprprompt.rasi

echo $(printf "%s\n" No Yes | rofi -u 1 -config "$config" -dmenu -i -p "$1" || echo No)
