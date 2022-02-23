#!/bin/sh

#▁▂▃▄▅▆▇█

battery_print() {
    PATH_AC="/sys/class/power_supply/AC"
    PATH_BATTERY_0="/sys/class/power_supply/BAT0"
    PATH_BATTERY_1="/sys/class/power_supply/BAT1"

    ac=0
    battery_level_0=0
    battery_level_1=0
    battery_max_0=0
    battery_max_1=0

    f="$PATH_AC/online"
    [ -f "${f}" ] && ac=$(cat "${f}")

    f="$PATH_BATTERY_0/energy_now"
    [ -f "${f}" ] && battery_level_0=$(cat "${f}")

    f="$PATH_BATTERY_0/energy_full"
    [ -f "${f}" ] && battery_max_0=$(cat "${f}")

    f="$PATH_BATTERY_1/energy_now"
    [ -f "${f}" ] && battery_level_1=$(cat "${f}")

    f="$PATH_BATTERY_1/energy_full"
    [ -f "${f}" ] && battery_max_1=$(cat "${f}")

    battery_level=$(("$battery_level_0 + $battery_level_1"))
    battery_max=$(("$battery_max_0 + $battery_max_1"))

    if [ "${battery_max}" -eq 0 ]; then
        return
    fi

    battery_percent=$(("$battery_level * 100"))
    battery_percent=$(("$battery_percent / $battery_max"))

    label="${battery_percent}"
    if [ "$ac" -eq 1 ]; then
        label="⚡ ${label}"
    fi

    echo "${label}"
}

path_pid="/tmp/polybar-battery-combined-udev.pid"

case "$1" in
--update)
    pid=$(cat $path_pid)

    if [ "$pid" != "" ]; then
        kill -10 "$pid"
    fi
    ;;
*)
    echo $$ >$path_pid

    trap exit INT
    trap "echo" USR1

    while true; do
        battery_print

        sleep 30 &
        wait
    done
    ;;
esac
