#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xkbevd &
setxkbmap -option caps:escape # use caps as esc (caps:swapescape to swap)
setxkbmap -layout us,ru -option grp:toggle # change layout with AltGr
setxkbmap -model face -layout us,ru -option grp:toggle # secondary keyboard too

xmodmap -e "keycode 47 = colon semicolon Cyrillic_ZHE" # remap : and ; + still supports cyrillic

xsetroot -cursor_name left_ptr

xinput disable 12 # disable touchpad

xset -r # disable key repeat
xset -b # disable bell

xrdb -merge ~/.Xresources

unclutter & # hide mouse cursor

redshift -l 60:30 &disown # adjust color temperature according to daytime

skypetab-ng &

# automount disks to /media
udiskie &

tmux new-session -d -s rtorrent rtorrent

autocutsel -selection CLIPBOARD -fork
autocutsel -selection PRIMARY -fork

#xrandr --output LVDS --auto --output HDMI-0 --off
xrandr --output LVDS --mode 1280x720 --output HDMI-0 --mode 1600x1200

mpd &

xset s 300 # idle is 5 min
~/.config/xsidle.sh slock & # lock screen when idle

/usr/bin/awesome
