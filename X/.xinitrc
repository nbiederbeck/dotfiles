# vim: commentstring=#%s
xset r rate 300 50 &
xmodmap ~/.Xmodmap &
unclutter --timeout=5 --jitter=1 -b &
if ! [[ $(pgrep redshift) ]]; then
    redshift &
fi
tresorit &
xrdb $HOME/.Xresources &


# Start Window Manager
# gnome-session
exec i3
