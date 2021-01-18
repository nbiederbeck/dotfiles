#!/bin/bash
help="HELP:

This script sets the sensitivity of my RØDE microphone.  There are two
settings, one for much talking (and typing), where the microphone is
near the mouth.  The other setting is mostly for when I have not much
to say (or do not type at all), the microphone turned away.  We will
query the sources using 'pamixer', and set the levels according to the
command line argument. 

USAGE:

./mic.sh talk|near
./mic.sh listen|far
"""

id=$(pamixer --list-sources | awk '/RØDE NT-USB Mini Mono/ {print $1}')

case $1 in

    default|talk|near) value=55 ;;
    listen|far) value=80 ;;

    *)
        echo "${help}"
        exit 1
        ;;

esac

pamixer "--source=${id}" --set-volume "${value}"
notify-send --expire-time 1000 -- "RØDE" "Set microphone to ${value}%"
