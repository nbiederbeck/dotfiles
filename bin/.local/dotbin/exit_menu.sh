#!/usr/bin/env bash

LOCK="${HOME}/.local/dotbin/lock.sh"
SLEEP="systemctl hybrid-sleep"
GIT="${HOME}/.local/dotbin/checkgit"
CONFIRM="${HOME}/.local/dotbin/confirm.sh"

function cmd_shutdown() {
    (${GIT} || ${CONFIRM} Shutdown?) && systemctl poweroff
}
function cmd_reboot() {
    systemctl reboot
}
function cmd_lock() {
    ${LOCK}
}
function cmd_sleep() {
    (${GIT} || ${CONFIRM} Sleep?) && ${SLEEP}
}
function cmd_logout() {
    i3-msg exit
}

typeset -A menu
menu=(
    [Shutdown]=cmd_shutdown
    [Reboot]=cmd_reboot
    [Lock]=cmd_lock
    [Sleep]=cmd_sleep
    [Logout]=cmd_logout
)

case "${1}" in
-h | --help)
    echo "Help:
    Run without arguments for interactive selection
    or give one of Shutdown, Reboot, Lock, Sleep, Logout as argument."
    ;;
Shutdown | Reboot | Lock | Sleep | Logout)
    ${menu[$1]}
    ;;
*)
    selection="$(printf '%s\n' "${!menu[@]}" | sort | dmenu -i -p Exit)"
    if [ -n "${selection}" ]; then
        ${menu[${selection}]}
    fi
    ;;
esac
