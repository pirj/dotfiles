set __fish_git_prompt_showdirtystate 1

# only show hostname (highlighted) if connected to remote
function fish_prompt -d "Write out the prompt"
  printf '%s@%s:%s%s%s%s%s%s $ ' (whoami) (hostname|cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (set_color $fish_color_quote) (__fish_git_prompt) (set_color normal)
end

function fish_right_prompt -d "Write out the right prompt"
  date "+[%H:%M:%S] "
end

# SSH agent
# when fish isn't a login shell, keychain passes wrong (sh/bash/zsh's) script for eval
set SHELL fish; eval (keychain --eval --agents ssh,gpg --quiet .ssh/id_*a)

# start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end
