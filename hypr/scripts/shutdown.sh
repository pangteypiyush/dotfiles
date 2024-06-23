#!/bin/bash

if [[ "$(~/.config/hypr/scripts/rofi_prompt.sh Shutdown)" == "Yes" ]]; then
    poweroff
fi
