#!/bin/bash
set -eo pipefail

scriptname=$(basename "${0}")
usage="Help:

This script (${scriptname}) interacts with my RØDE microphone.

Firstly, it is used to setup the default values with 'pactl'.

After that, it is called by i3 to in-/decrease the volume of
my headphones or mute them.
Additionally, it can set the volume for the microphone/headset.

If headphone volume is changed, it is displayed via 'xob'.

Examples:

* ./${scriptname} setup
* ./${scriptname} increase|decrease|toggle-mute headphones|microphone
* ./${scriptname} set microphone|headphones 55
* ./${scriptname} get microphone|headphones

"

# find your speakers/headphones with "pactl list-sinks | grep 'name:'"
output="alsa_output.usb-Creative_Technology_Ltd_Sound_Blaster_G3_554B49C810751D81-03.analog-stereo"
# find your microphone with "pactl list-sources | grep 'name:'"
mic="alsa_input.usb-Creative_Technology_Ltd_Sound_Blaster_G3_554B49C810751D81-03.analog-stereo"

xobfile=$(mktemp)
value=1 # default increase step

case $1 in

setup)
    pactl set-default-sink "${output}"
    pactl set-default-source "${mic}"

    exit
    ;;

increase) ;;
decrease) ;;
mute) ;;
unmute) ;;
toggle-mute) ;;
get) ;;
set) value=$3 ;;

*)
    echo "${usage}"
    exit 1
    ;;

esac

case $2 in

headphones | speakers)
    option="sink"
    name="${output}"
    ;;
microphone | mic)
    option="source"
    name="${mic}"
    mod="!"
    ;;

*)
    echo "${usage}"
    exit 1
    ;;

esac

# set volume
pamixer "--${option}=${name}" "--$1" "${value}"

# display change
volume=$(pamixer --get-volume "--${option}=${name}")
mute=$(pamixer --get-mute "--${option}=${name}")

if [ "${mute}" == "true" ]; then
    volume=0
fi

echo "${volume}${mod}" >>"${xobfile}"
