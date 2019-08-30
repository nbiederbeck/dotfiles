#!/usr/bin/env bash

LOCKSCRIPT="~/.local/bin/betterlockscreen -l blur -t '$USER@$HOSTNAME'"
GITSCRIPT="~/.local/bin/checkgit"

ROFI_TEXT="Exit"
ROFI_OPTIONS=(-width 100 -location 1 -hide-scrollbar -bw 1 -font "SourceCodeVariable 10")

enable_confirmation=false

# menu defined as an associative array
typeset -A menu

# Menu with keys/commands
menu=(
  [Shutdown]="${GITSCRIPT} && systemctl poweroff"
  [Reboot]="systemctl reboot"
  [Lock]="${LOCKSCRIPT}"
  [Sleep]="${GITSCRIPT} && ${LOCKSCRIPT} & sleep 1 & systemctl suspend"
  [Logout]="i3-msg exit"
)
menu_nrows=${#menu[@]}

# Menu entries that may trigger a confirmation message
menu_confirm="Shutdown Reboot Logout"

launcher_exe="rofi"
launcher_options=(-dmenu -i -lines 1 -columns "${menu_nrows}" -p "${ROFI_TEXT}" "${ROFI_OPTIONS[@]}")
launcher=(${launcher_exe} "${launcher_options[@]}")

selection="$(printf '%s\n' "${!menu[@]}" | sort | "${launcher[@]}")"

function ask_confirmation() {
  if [ "${launcher_exe}" == "rofi" ]; then
    confirmed=$(echo -e "Yes\nNo" | rofi -dmenu -i -columns 2 -p "${selection}?" \
      "${ROFI_OPTIONS[@]}")
    [ "${confirmed}" == "Yes" ] && confirmed=0
  fi

  if [ "${confirmed}" == 0 ]; then
    i3-msg -q "exec ${menu[${selection}]}"
  fi
}

if [[ $? -eq 0 && ! -z ${selection} ]]; then
  if [[ "${enable_confirmation}" = true && \
        ${menu_confirm} =~ (^|[[:space:]])"${selection}"($|[[:space:]]) ]]; then
    ask_confirmation
  else
    i3-msg -q "exec ${menu[${selection}]}"
  fi
fi
