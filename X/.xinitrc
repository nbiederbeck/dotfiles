# vim: commentstring=#%s
xset r rate 300 80 &
xmodmap ~/.Xmodmap &
xrdb $HOME/.Xresources &

# Start Window Manager
# exec gnome-session
exec i3
# exec bspwm
# exec alacritty --dimensions 151 42
