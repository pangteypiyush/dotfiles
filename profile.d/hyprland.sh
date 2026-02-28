if [[ -z "$DISPLAY" ]] && [[ "$(tty)" == '/dev/tty1' ]] && [ "$XDG_VTNR" -eq 1 ]; then
    # FIXME: exec doesn't work
    # exec start-hyprland
    start-hyprland
fi
