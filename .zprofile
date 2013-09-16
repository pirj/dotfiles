if [ -n "$DISPLAY" ]; then
#     BROWSER=epiphany
fi

# Execute SSH agent
eval $(keychain --eval --agents ssh,gpg --quiet ~/.ssh/id_*a)

# autorun X
if [[ -z "$DISPLAY" &&  $(tty) = /dev/tty1 ]]; then
  exec startx
fi
