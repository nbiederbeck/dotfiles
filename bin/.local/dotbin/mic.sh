#!/bin/bash
help="HELP:

This script sets the sensitivity of my RØDE microphone.  There are two
settings, one for much talking (and typing), where the microphone is
near the mouth.  The other setting is mostly for when I have not much
to say (or do not type at all), the microphone turned away.

USAGE:

./mic.sh talk|near
./mic.sh listen|far
"""

case $1 in

    default|talk|near) value=55 ;;
    listen|far) value=80 ;;

    *)
        echo "${help}"
        exit 1
        ;;

esac

sound.sh set microphone $value
