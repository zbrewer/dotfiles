#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# if [ -d /etc/X11/xinit/xinitrc.d ]; then
#   for f in /etc/X11/xinit/xinitrc.d/*; do
#     [ -x "$f" ] && . "$f"
#   done
#   unset f
# fi

xbindkeys
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
exec i3
# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
