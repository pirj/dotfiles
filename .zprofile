if [ -n "$DISPLAY" ]; then
#     BROWSER=epiphany
fi

# Execute SSH agent
eval $(keychain --eval --agents ssh,gpg --quiet ~/.ssh/id_*a)

if [[ ! -d "$tmp" ]]; then
  export tmp="/tmp/$USER"
  mkdir -p -m 700 "$tmp"
fi

# autorun X
if [[ -z "$DISPLAY" &&  $(tty) = /dev/tty1 ]]; then
  exec startx
fi
