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
# setxkbmap -option caps:escape # use caps as esc (caps:swapescape to swap)
setxkbmap -layout us,ru -option grp:toggle # change layout with AltGr
#setxkbmap -model face -layout us,ru -option grp:toggle # secondary keyboard too
setxkbmap -option compose:rctrl # use RCtl as Compose key (http://en.wikipedia.org/wiki/Compose_key) See full list of combinations (http://cgit.freedesktop.org/xorg/lib/libX11/plain/nls/en_US.UTF-8/Compose.pre)

# Remap symbols, still support cyrillic
xmodmap -e "keycode 47 = colon semicolon Cyrillic_zhe Cyrillic_ZHE"
xmodmap -e "keycode 49 = asciitilde grave Cyrillic_io Cyrillic_IO"

# Map CapsLock to a more useful double behavior Esc(tap)/Control(hold)
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "remove Control = Control_L"
xmodmap -e "keysym Control_L = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_L"
xmodmap -e "add Control = Control_L"
xcape -t 1000 -e "Control_L=Escape" # Fire nothing if 1000ms hold time out

# # Bind mod3 to Fn
# xmodmap -e "remove mod4 = Super_L" # Win
# xmodmap -e "keycode 151 = Hyper_R" # Fn
# xmodmap -e "add mod3 = Hyper_R Super_L"

# TODO:
# Map Mod3 somewhere!
# Separate shifts to ensure opposite shift is pressed with a special symbol
# Enter + HJKL ?

# Eventually move the above to .Xmodmap, or use a superior xkb, or ibus, or scim, or fcitx, or wait for Wayland to fix all this shit
# xmodmap ~/.Xmodmap

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
