if [ -n "$DISPLAY" ]; then
#     BROWSER=epiphany
fi

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Execute SSH agent
eval $(keychain --eval --agents ssh,gpg --quiet .ssh/id_*a)

# autorun X
if [[ -z "$DISPLAY" &&  $(tty) = /dev/tty1 ]]; then
  exec startx
fi
