#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession
# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
	[ -x "$f" ] && . "$f"
    done
    unset f
fi
picom -f &
lxpolkit &
nm-applet --indicator &
copyq &
xfce4-power-manager &
flameshot &
nitrogen --restore &
~/.scripts/statusbar/startbar &
# Loop
while true; do
	dwm > /dev/null 2>&1
done
exec dwm
