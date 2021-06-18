#!/bin/bash

# colors
blank=00000000
yellow=EBCB8BFF
red=BF616AFF
green=A3BE8CFF

case "${XDG_SESSION_TYPE}" in
    tty)
        if [ -n "${I3SOCK}" ]; then
            i3lock
        fi
        ;;
    wayland)
        notify-send -u critical "Lock wayland" "Not yet supported"
        ;;
    x11)
        if [ -n "${I3SOCK}" ]; then
            i3lock -c '#121212' \
                --inside-color="${blank}" \
                --insidever-color="${blank}" \
                --ringver-color="${blank}" \
                --ring-color="${blank}" \
                --line-color="${yellow}" \
                --separator-color="${blank}" \
                --verif-color="${blank}" \
                --keyhl-color="${green}" \
                --bshl-color="${red}" \
                --insidewrong-color="${blank}" \
                --ringwrong-color="${red}" \
                --wrong-color="${red}"
        fi
        ;;
esac
