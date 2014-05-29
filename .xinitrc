#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xkbevd &

# Change layout with AltGr "group(toggle)"
# Use RCtl as Compose key http://en.wikipedia.org/wiki/Compose_key "compose(rctrl)"
# See full list of combinations http://cgit.freedesktop.org/xorg/lib/libX11/plain/nls/en_US.UTF-8/Compose.pre
setxkbmap -layout "us+custom(default),ru(winkeys)" -option "" -option "grp:toggle,compose:rctrl" -print | xkbcomp -I"$HOME/.config/xkb" - "${DISPLAY%%.*}"

# Map CapsLock to a more useful double behavior Esc(tap)/Control(hold)
# Fire nothing if 1000ms hold time out
xcape -t 1000 -e "Control_L=Escape"

xsetroot -cursor_name left_ptr

xinput disable "SynPS/2 Synaptics TouchPad"

xset -r # disable key repeat
xset -b # disable bell

xrdb -merge ~/.Xresources

unclutter & # hide mouse cursor

redshift &disown # adjust color temperature according to daytime

skypetab-ng &
#cpulimit -l 3 -p `ps -C skype -o pid=` &disown
#netbrake -r 300 skype

# automount disks to /media
udiskie &

tmux new-session -d -s rtorrent rtorrent

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

#xrandr --output LVDS --auto --output HDMI-0 --off
#xrandr --output LVDS --mode 1280x720 --output HDMI-0 --mode 1600x1200
xrandr --output LVDS --off --output HDMI-0 --mode 1600x1200

xset s 300 # idle is 5 min
~/.config/xsidle.sh slock & # lock screen when idle
~/.config/xsidle.sh echo "pomodoro.idle()" | awesome-client & # squash pomodoro if away during working period

# Hotkey daemon
sxhkd -c .config/sxhkdrc &disown

# Random wallpaper
hsetroot -center ~/wallpapers/$(ls wallpapers | shuf| tail -n 1)

# Compton window composer
compton &

/usr/bin/awesome
