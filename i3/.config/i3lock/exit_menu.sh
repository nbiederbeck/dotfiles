#!/usr/bin/env bash

LOCK="~/.config/i3lock/lock.sh"
SLEEP="i3lock -i ${HOME}/Pictures/background $(cat ~/.config/i3lock/options) && systemctl suspend"
GIT="~/.local/dotbin/checkgit"

# menu defined as an associative array
typeset -A menu

# Menu with keys/commands
menu=(
  [Shutdown]="${GIT} && systemctl poweroff"
  [Reboot]="systemctl reboot"
  [Lock]="${LOCK}"
  [Sleep]="${GIT} && ${SLEEP}"
  [Logout]="i3-msg exit"
)
menu_nrows=${#menu[@]}

launcher_exe="dmenu -i -p Exit"
launcher=(${launcher_exe})

selection="$(printf '%s\n' "${!menu[@]}" | sort | "${launcher[@]}")"

if [[ $? -eq 0 && ! -z ${selection} ]]; then
    i3-msg -q "exec ${menu[${selection}]}"
fi
