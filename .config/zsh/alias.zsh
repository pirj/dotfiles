# Platform specific values

if [[ "$OSTYPE" = "linux"* ]]; then
  LS_COLOR='--color'
fi

if [[ "$OSTYPE" != "darwin"* ]]; then
  # Start week on Monday
  alias cal='cal -m'
fi

alias ls='ls $LS_COLOR'
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -lhA'

# Use editor consistently
alias view=$EDITOR -R
alias edit=$EDITOR

# Run tmux in 256 color mode
alias tmux='tmux -2'
alias tmux='direnv exec / tmux'

# tmux aliases
alias ta='tmux at'
alias tat='tmux at -t'
alias tls='tmux ls'
alias tn='tmux new -s'

# Google translate cli, en -> ru
function trs { trans {ru=} "$*" }
function tru { trans {=ru} "$*" }

# Rails
alias r='spring rails'
alias rails='echo Attempt to use non-spring variation of rails'

# Pretty self explaining
alias g=git

# Handy pipes
alias -g G='| grep -a'
alias -g P='| $PAGER'
alias -g W='| wc -l'
alias -g H='| head -n'
if [[ "$OSTYPE" = "darwin"* ]]; then
  alias -g C='| pbcopy'
else
  alias -g C='| xsel -i && xsel -o'
fi
alias -g S="| curl --silent --form 'f:1=<-' ix.io C"
alias -g F='| less +F'
alias -g V='| tee $(rm fifo.tmp; mkfifo fifo.tmp && echo fifo.tmp) &; vim $(< fifo.tmp ) && rm fifo.tmp'
alias -g T='| tee -a '

# Factor listener, readline handler wrapped
alias factor='rlwrap factor-vm -run=listener'

# Transmission ncurses remote cli
alias tra='transmission-remote-cli'

# Find that fat files
#alias space='du --dereference --max-depth=2 -h . | sort -h -r | head -n 20'
alias space='du -d 2 -k -c . | sort -n -r | head -n 20'

# Password generation. Just one. Print and put to clipboard
alias pwgen='pwgen -1cnsB 12 C'

# Stupid MySQL treats ^C as ^D
alias mysql='mysql --sigint-ignore'

# TLDR cheat sheets
alias "?"=tldr

# Some TimeWarrior shortcuts
function sow {
  timew summary sow - now $1
}
alias tt='timew track'

# Fuzzy find
function fn { find . -name "*$1*" }

# Script-it!
function script-it {
  echo alias $1=\"$(fc -nl -1)\" >> ~/.config/zsh/alias.zsh
}
alias day="timew summary sod - now"
# alias send-daily-report='day >! tmp/timesheets/$( TZ=EST date +%Y-%m-%d ).txt; gdrive sync upload tmp/timesheets 0Bz9xh1gcOv5FODhpRE9uRnU3VTA'

alias toreman="grep --invert-match '#' < Procfile | sed -e 's/^[^:]*: //' | xargs -I {} tmux split-window -v \; send-keys '[ -s .env ] && source .env; {}' 'C-m' && tmux select-pane -t 1 \; send-keys 'C-d' \; select-layout even-vertical"

function k9 {
  pgrep -f "$1" | xargs kill -9
}
