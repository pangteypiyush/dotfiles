if [[ "$(tty)" == '/dev/tty1' ]]; then
    [[ -z "$DISPLAY$SSH_TTY$(pgrep xinit)" ]] && exec Hyprland
fi
