#!/usr/bin/env bash

LOCKSCRIPT="slock"
GITSCRIPT="~/.local/bin/git_tmux"

ROFI_TEXT="?"
ROFI_OPTIONS=(-width 10 -location 0 -hide-scrollbar -bw 1 -fullscreen -font "SourceCodePro 52" -padding 100)

enable_confirmation=false

# menu defined as an associative array
typeset -A menu

# Menu with keys/commands
menu=(
  [Shutdown]="${GITSCRIPT} && systemctl poweroff"
  [Reboot]="systemctl reboot"
  [Lock]="${LOCKSCRIPT}"
  [Sleep]="${GITSCRIPT} && ${LOCKSCRIPT} & systemctl suspend"
  [Logout]="${GITSCRIPT} && i3-msg exit"
)
menu_nrows=${#menu[@]}

# Menu entries that may trigger a confirmation message
menu_confirm="Shutdown Reboot Logout"

launcher_exe="rofi"
launcher_options=(-dmenu -i -lines "${menu_nrows}" -p "${ROFI_TEXT}" "${ROFI_OPTIONS[@]}")
launcher=(${launcher_exe} "${launcher_options[@]}")

selection="$(printf '%s\n' "${!menu[@]}" | sort | "${launcher[@]}")"

function ask_confirmation() {
  if [ "${launcher_exe}" == "rofi" ]; then
    confirmed=$(echo -e "Yes\nNo" | rofi -dmenu -i -lines 2 -p "${selection}?" \
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
