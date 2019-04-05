#!/bin/bash

sleep 30s

for desktop_files in ~/.config/autostart/*.desktop; do
	gtk-launch `basename $desktop_files`
done
gtk-launch guake
