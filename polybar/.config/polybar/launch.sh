#!/bin/bash

pkill polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 0.1; done

polybar small &!

echo "Bars launched"
