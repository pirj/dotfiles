#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Change layout with AltGr "group(toggle)"
# Use RCtl as Compose key http://en.wikipedia.org/wiki/Compose_key "compose(rctrl)"
# See full list of combinations http://cgit.freedesktop.org/xorg/lib/libX11/plain/nls/en_US.UTF-8/Compose.pre
# Latch Shifts
setxkbmap -layout "us+custom(default),ru(winkeys)" -option "" -compat "complete+custom(latch)" -print | xkbcomp -I"$HOME/.config/xkb" - "${DISPLAY%%.*}"

# Map CapsLock to a more useful double behavior Esc(tap)/Control(hold)
# Map Return to a Return(tap)/Super(hold)
# Fire nothing if 1000ms hold time out
xcape -t 300 -e "Control_L=Escape"
# xcape -t 1000 -e "Meta_L=Return"

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

mpd &

transmission-daemon

autocutsel -fork &
autocutsel -selection PRIMARY -fork &

xrandr --output LVDS-1 --off --output VGA-1 --preferred

xset s 300 # idle is 5 min
~/.bin/xsidle.sh slock & # lock screen when idle

# Hotkey daemon
sxhkd &disown

# Random wallpaper
hsetroot -center ~/wallpapers/$(ls wallpapers | shuf| tail -n 1)

# Compton window composer
# compton &

urxvtd &

# jackd -v -dalsa -D -Phw:1 &disown

# awesome
exec gnome-session
