#!/bin/bash
xidlehook \
    --timer 300 "i3lock -i ${HOME}/Pictures/blue_screen_of_death_resize.jpg -t" "" \
    --not-when-audio --not-when-fullscreen
