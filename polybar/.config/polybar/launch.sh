#!/bin/bash
pkill polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done

case "${HOST}" in
    *) bar=small ;;
esac

polybar --config="${HOME}/.config/polybar/config.ini" "${bar}" &!

echo "Bars launched"
