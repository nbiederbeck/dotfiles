# vim: commentstring=#%s
xset r rate 300 80 &
xmodmap ~/.Xmodmap &
unclutter --timeout=5 --jitter=1 -b &
if ! [[ $(pgrep redshift) ]]; then
    redshift &
fi
xrdb $HOME/.Xresources &
nm-applet &
blueman-applet &


# Start Window Manager
# gnome-session
exec i3
# exec alacritty --dimensions 151 42
