if [[ -s $HOME/.zsh/oh-my-zsh ]]; then
  ZSH=$HOME/.zsh/oh-my-zsh
  plugins=(fasd sprunge)
  source $ZSH/oh-my-zsh.sh
fi

# Vim's text-objects-ish for zsh
if [[ -s .zsh/opp ]]; then
  source .zsh/opp/*.zsh
  source .zsh/opp/opp/*.zsh
fi

# # The configuration framework for Zsh
# if [[ -s .zsh/prezto/init.zsh ]]; then
#   source .zsh/prezto/init.zsh
# fi

# Color scheme
if [[ -s ~/.zsh/colors.sh ]]; then
  source ~/.zsh/colors.sh
fi

# Quickly edit commonly used files
emulate sh -c 'source /usr/share/qfi/wrapper.sh'

RPROMPT='[%*]'
PROMPT_PROMPT="%(!.#.$)"

# Better vi mode (hat tip Doug Black)
bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey -a '^r' history-incremental-search-backward
bindkey -a H beginning-of-line
bindkey -a L end-of-line

function zle-line-init zle-keymap-select {
  if [[ $KEYMAP == main ]]; then
    MODE=''
  else
    MODE=$bg_bold[green]
  fi
  PROMPT='%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%} $(git_prompt_info)%{$MODE%}%(!.#.$)%{$reset_color%} '
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[red]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

# Switch back to fg %1 on ^Z (hat tip Adam Stankiewicz http://sheerun.net/)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
# TODO: does't work in vi mode

# Zsh, please...
unsetopt correct_all

# Reduce delay after you hit the <ESC> to 0.1 seconds (hat tip Doug Black)
export KEYTIMEOUT=1

export EDITOR=vim

# Shell aliases
alias ll='ls -l'
alias la='ls -a'

# Start week from Monday
alias cal='cal -m'

# Use nvim everywhere
# alias vim=nvim
# alias vi=nvim
# alias view=nvim -R
# alias edit=nvim
alias vi=vim
alias view=vim -R
alias edit=vim

# Run tmux in 256 color mode
alias tmux='tmux -2'

export TERM=xterm-256color
alias ssh='TERM=xterm-color ssh'

# tmux aliases
alias ta='tmux at'
alias tat='tmux at -t'
alias tls='tmux ls'
alias tn='tmux new -s'

# Google translate cli, en -> ru
alias tru='trs {=ru}'

# Pretty self explaining
alias g=git

# Handy pipes
alias -g G='| grep'
alias -g L='| less'
alias -g W='| wc -l'
alias -r T='tail -f'

# Factor listener, readline handler wrapped
alias factor='rlwrap factor-vm -run=listener'

# Find that fat files
alias space='du --max-depth=2 -h . | sort -h -r | head -n 20'

# Password generation. Just one. Print and put to clipboard
alias pwgen='pwgen -1cnsB 12 >&2 | xclip'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# LiveScript
[[ -s "$HOME/node_modules/LiveScript" ]] && PATH=$PATH:$HOME/node_modules/LiveScript/bin
