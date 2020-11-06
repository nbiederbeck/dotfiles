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

output="RØDE NT-USB Mini Analog Stereo"

case $2 in

    headphones | speakers)
        option="sink"
        ;;

    microphone | mic)
        option="source"
        ;;

    *)
        echo "'${2}' not supported." >&2
        exit 1
        ;;

esac

id=$(pamixer --list-"${option}s" | awk '/RØDE NT-USB Mini Analog Stere/ {print $1}')
echo "id=$id"

pamixer "--${option}=${id}" --$1 2
volume=$(pamixer --get-volume-human)
dunstify \
    --replace 239857 \
    --timeout 1000 \
    -- \
    "Volume" "${volume}"
