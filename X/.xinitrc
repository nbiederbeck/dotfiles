# vim: commentstring=#%s

# set keyboard repeat rate to 80 ms and repeat delay to 300 ms
xset r rate 300 80

# set custom keyboard layout
xmodmap ~/.Xmodmap

# activate notifier
dunst &

# start window manager (keep last)
exec i3
