# Prevent overwriting existing files with '> filename', use '>| filename' # (or >!) instead.
# Hat tip http://ruderich.org/simon/config/zshrc
setopt noclobber

# Zsh, please...
unsetopt correct_all

# Reduce delay after you hit the <ESC> to 0.2 seconds (hat tip Doug Black)
KEYTIMEOUT=20
EDITOR=nvim

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

. ~/.zsh/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

# Better vi mode (hat tip Doug Black)
bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey -a '^r' history-incremental-search-backward

bindkey -a H beginning-of-line
bindkey -a L end-of-line

# Better undo/redo
bindkey -M vicmd u undo
bindkey -M vicmd U redo

# Switch to command mode. jk or kk or jj are to slow to work with 0.1s timeout
# kjk<CR> to repeat last command
bindkey -M viins kj vi-cmd-mode

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

# Color scheme
[[ -s ~/.zsh/colors.sh ]] && source ~/.zsh/colors.sh
autoload -U colors && colors

# Git prompt
[[ -s /usr/share/git/git-prompt.sh ]] && source /usr/share/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=0

# Prompt
function prompt {
  PROMPT="%n@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$fg[green]%}%$(__git_ps1) %{$reset_color%}% %(!.#.$) "
}
autoload -U add-zsh-hook
add-zsh-hook precmd prompt

# Shell prompt always in the bottom of the screen
tput cup $LINES

# Aliases
source "$HOME/.zsh/alias.zsh"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Adds Node module (LiveScript, Jasmin) binaries into path
[[ -s "$HOME/node_modules" ]] && PATH=$PATH:$HOME/node_modules/.bin
