#!/usr/bin/env bash

# Setup of commands
# -----------------

LOCK="~/.local/dotbin/lock.sh"
SLEEP="${LOCK} && systemctl suspend"
GIT="~/.local/dotbin/checkgit"
FORCE="~/.local/dotbin/confirm.sh"

cmd_shutdown="(${GIT} || ${FORCE} shutdown) && systemctl poweroff"
cmd_reboot="systemctl reboot"
cmd_lock="${LOCK}"
cmd_sleep="(${GIT} || ${FORCE} sleep) && ${SLEEP}"
cmd_logout="i3-msg exit"

run="i3-msg"




# Running the menu
# ----------------

typeset -A menu
menu=(
  [Shutdown]="${cmd_shutdown}"
  [Reboot]="${cmd_reboot}"
  [Lock]="${cmd_lock}"
  [Sleep]="${cmd_sleep}"
  [Logout]="${cmd_logout}"
)
menu_nrows=${#menu[@]}

launcher_exe="dmenu -i -p Exit"
launcher=(${launcher_exe})

selection=$1
if [[ -z "${selection}" ]]; then
    selection="$(printf '%s\n' "${!menu[@]}" | sort | "${launcher[@]}")"
fi

if [[ $? -eq 0 && ! -z ${selection} ]]; then
    ${run} -q "exec ${menu[${selection}]}"
fi
