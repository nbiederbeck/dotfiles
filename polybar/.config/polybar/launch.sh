#!/bin/bash

while pgrep -u $UID -x polybar >/dev/null; do
    pkill -9 polybar
    sleep 0.1
done

case "${HOST}" in
*) bar=small ;;
esac

sh -c "polybar --config=${HOME}/.config/polybar/config.ini ${bar} &"

echo "Bars launched"
