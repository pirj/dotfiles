# Execute SSH agent
[[ $SSH_AGENT_PID -eq "" ]] && eval $(keychain --eval --agents ssh,gpg --quiet ~/.ssh/id_*[^pub])

if [[ ! -d "$tmp" ]]; then
  export tmp="/tmp/$USER"
  mkdir -p -m 700 "$tmp"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
