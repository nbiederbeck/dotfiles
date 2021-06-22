#!/bin/bash

dotfiles=(
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
)

for files in "${dotfiles[@]}"; do
    stow --target "${HOME}" "${files}/"
done
