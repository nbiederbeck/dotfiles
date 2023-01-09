#!/bin/bash

set -e

dotfiles=(
    alacritty
    color
    dunst
    git
    i3
    ipython
    nvim
    polybar
    redshift
    restic
    rofi
    tmux
    X
    yay
    zathura
    zsh
)

case $1 in
--remove)
    arg="--delete"
    ;;
*)
    arg="--restow"
    ;;
esac

for files in "${dotfiles[@]}"; do
    stow "${arg}" --target "${HOME}" "${files}/"
done
