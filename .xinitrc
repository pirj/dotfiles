#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xkbevd &

xkbcomp $HOME/.config/xkb/my $DISPLAY
# -w 0 for no warnings

# Map CapsLock to a more useful double behavior Esc(tap)/Control(hold)
xcape -t 1000 -e "Control_L=Escape" # Fire nothing if 1000ms hold time out

xsetroot -cursor_name left_ptr

xinput disable 12 # disable touchpad

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

/usr/bin/awesome
