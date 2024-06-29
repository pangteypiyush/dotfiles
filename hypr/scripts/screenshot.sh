#!/bin/bash

DIR=~/Screenshots
file=`date +'%Y%m%d_%H%M_grim.png'`

grim -g "$(slurp)" "$DIR/$file" \
    && copyq copy image/png "$DIR/$file" \
    && hyprctl notify 5 2500 0 "Screenshot: $file"
