# vim: commentstring=#%s
xset r rate 300 80 &
xmodmap ~/.Xmodmap &
xrdb $HOME/.Xresources &

# Start Window Manager
exec i3
