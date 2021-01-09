# If running from tty1 start sway
if status is-login
set TTY1 (tty)
    if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
      exec sway
    end
end
