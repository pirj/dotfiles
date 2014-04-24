# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git git-flow git-extras fasd history history-substring-search colored-man rvm sprunge taskwarrior systemd)

source $ZSH/oh-my-zsh.sh

# https://github.com/hchbaw/opp.zsh
source .opp.zsh/*.zsh
source .opp.zsh/opp/*.zsh

PROMPT='%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%} $(git_prompt_info)%(!.#.$) '
RPROMPT='[%*]'

# Better vi mode (hat tip Doug Black)
bindkey -v
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
  RPROMPT='${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} [%*]'
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[red]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"

unsetopt correct_all

# Reduce delay after you hit the <ESC> to 0.1 seconds (hat tip Doug Black)
export KEYTIMEOUT=1

export EDITOR=vim

# Shell aliases
alias ll='ls -l'
alias la='ls -a'

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

alias ssh='TERM=xterm-color ssh'

# tmux aliases
alias ta='tmux at'
alias tat='tmux at -t'
alias tls='tmux ls'
alias tn='tmux new -s'

# Google translate cli, en -> ru
alias tru='trs {=ru}'

## git
# Faster branch switching
alias gc-='git checkout -'

# Handy aliases
alias -g g='| grep'
alias -g l='| less'
alias -g w='| wc -l'
alias -r tf='tail -f'
alias space='du --max-depth=2 -h . | sort -h -r | head -n 20'

# Password generation. Just one. Print and put to clipboard
alias pwgen='pwgen -1cnsB 12 >&2 | xclip'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Color scheme
source ~/.colors.sh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
