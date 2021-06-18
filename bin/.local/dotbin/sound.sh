#!/bin/bash
scriptname=$(basename "${0}")
usage="Help:

This script (${scriptname}) interacts with my RØDE microphone.

Firstly, it is used to setup the default values with 'pacmd'.

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

rode_out="alsa_output.usb-R__DE_Microphones_R__DE_NT-USB_Mini_A115C4EE-00.analog-stereo"
rode_mic="alsa_input.usb-R__DE_Microphones_R__DE_NT-USB_Mini_A115C4EE-00.mono-fallback"

xobfile=/tmp/sound.xob
value=1  # default increase step

case $1 in

    setup)
        pacmd set-default-sink   "${rode_out}"
        pacmd set-default-source "${rode_mic}"

        rm -f "${xobfile}"
        touch "${xobfile}"
        tail -f "${xobfile}" | xob -s sound &

        exit
    ;;

    increase) ;;
    decrease) ;;
    mute) ;;
    unmute) ;;
    toggle-mute) ;;
    get) ;;
    set) value=$3;;

    *) echo "${usage}"; exit 1 ;;

esac

case $2 in

    headphones | speakers)
        option="sink"
        name="${rode_out}"
    ;;
    microphone | mic)
        option="source"
        name="${rode_mic}"
        mod="!"
    ;;

    *) echo "${usage}"; exit 1 ;;

esac

# set volume
pamixer "--${option}=${name}" "--$1" "${value}"

# display change
volume=$(pamixer --get-volume "--${option}=${name}")
mute=$(pamixer --get-mute "--${option}=${name}")

if [ "${mute}" == "true" ]; then
    volume=0;
fi

echo "${volume}${mod}" >> "${xobfile}"
