#!/bin/bash

LIGHT="gruvbox"
DARK="nord"

FILE="$HOME/.config/nvim/plugin/color.vim"

if [[ $(grep ${LIGHT} ${FILE}) ]]; then
    sed -i "s/${LIGHT}/${DARK}/" ${FILE}
elif [[ $(grep ${DARK} ${FILE}) ]]; then
    sed -i "s/${DARK}/${LIGHT}/" ${FILE}
    source ~/.vim/plugged/gruvbox/gruvbox_256palette.sh
fi
