#!/usr/bin/env bash

LOCK="~/.config/i3lock/lock.sh"
SLEEP="${LOCK} && systemctl suspend"
GIT="~/.local/dotbin/checkgit"
FORCE="~/.local/dotbin/confirm.sh"

# menu defined as an associative array
typeset -A menu

# Menu with keys/commands
menu=(
  [Shutdown]="(${GIT} || ${FORCE} shutdown) && systemctl poweroff"
  [Reboot]="systemctl reboot"
  [Lock]="${LOCK}"
  [Sleep]="(${GIT} || ${FORCE} sleep) && ${SLEEP}"
  [Logout]="i3-msg exit"
)
menu_nrows=${#menu[@]}

launcher_exe="dmenu -i -p Exit"
launcher=(${launcher_exe})

selection=$1
if [[ -z "${selection}" ]]; then
    selection="$(printf '%s\n' "${!menu[@]}" | sort | "${launcher[@]}")"
fi

if [[ $? -eq 0 && ! -z ${selection} ]]; then
    i3-msg -q "exec ${menu[${selection}]}"
fi
