#!/bin/bash

set -e

dotfiles=(
    alacritty
    bat
    color
    dunst
    fish
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

for files in "${dotfiles[@]}"; do
    stow --target "${HOME}" "${files}/"
done
