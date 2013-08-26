if [ -n "$DISPLAY" ]; then
#     BROWSER=epiphany
fi

# autorun X
if [[ -z "$DISPLAY" &&  $(tty) = /dev/tty1 ]]; then
  exec startx
fi

source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh
