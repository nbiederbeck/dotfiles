#!/bin/bash

case "${XDG_SESSION_TYPE}" in
tty)
    if [ -n "${I3SOCK}" ]; then
        betterlockscreen --lock --off 1
    fi
    ;;
wayland)
    notify-send -u critical "Lock wayland" "Not yet supported"
    ;;
x11)
    if [ -n "${I3SOCK}" ]; then
        betterlockscreen --lock --off 1
    fi
    ;;
*)
    exit 1
    ;;
esac
