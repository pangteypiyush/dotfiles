#!/bin/bash

if [[ "$(~/.config/hypr/scripts/rofi_prompt.sh Reboot)" == "Yes" ]]; then
    reboot
fi
