#!/bin/bash
case $1 in

    increase);;
    decrease);;

    mute);;
    unmute);;
    toggle-mute);;

    *)
        echo "'${1}' not supported." >&2
        exit 1
        ;;

esac

case $2 in

    headphones | speakers)
        option="sink 0"
        ;;

    microphone | mic)
        option="source 0"
        ;;

    *)
        echo "'${2}' not supported." >&2
        exit 1
        ;;

esac

pamixer --${option} --$1 5
volume=$(pamixer --get-volume-human)
dunstify "Volume" "${volume}" \
    --urgency=low \
    --replace 239857 \
    --timeout 1000
