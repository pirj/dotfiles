# Platform specific values

if [[ "$OSTYPE" = "linux"* ]]; then
  LS_COLOR='--color'
fi

if [[ "$OSTYPE" != "darwin"* ]]; then
  # Start week on Monday
  alias cal='cal -m'
fi

# Better ls
alias ls='ls $LS_COLOR'
alias l='ls -lhA'
[[ -s $(which exa) ]] && alias l='exa -lhaG' && alias ls=exa

# Better find
[[ -s $(which fd) ]] && alias find=fd

# Better vim
[[ -s $(which nvim) ]] && alias vim=nvim

# Use editor consistently
alias view=$EDITOR -R
alias edit=$EDITOR

# Run tmux in 256 color mode
alias tmux='tmux -2'

# Make direnv and tmux friends
alias tmux='direnv exec / tmux'

# tmux aliases
alias ta='tmux at'
alias tn='tmux new -s'

# Google translate cli, en -> ru
function trs { trans {ru=} "$*" }
function tru { trans {=ru} "$*" }

# Pretty self explaining
alias g=git
alias r=rails

# Handy pipes
alias -g G='| rg --smart-case'
alias -g P='| $PAGER'
alias -g W='| wc -l'
alias -g H='| head -n'
alias -g X='| xargs'
alias -g X1='| xargs -L1'
if [[ "$OSTYPE" = "darwin"* ]]; then
  alias -g C='| pbcopy'
else
  alias -g C='| xsel -i && xsel -o'
fi
alias -g F='| less +F'
alias -g T='| tee -a '

# Find that fat files
#alias space='du --dereference --max-depth=2 -h . | sort -h -r | head -n 20'
alias space='du -hd2 * | sort -hr H 10'

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

alias day="timew summary sod - now"
# alias send-daily-report='day >! tmp/timesheets/$( TZ=EST date +%Y-%m-%d ).txt; gdrive sync upload tmp/timesheets 0Bz9xh1gcOv5FODhpRE9uRnU3VTA'

function k9 {
  pgrep -f "$1" | xargs kill -9
}

# CPU usage
# TODO: `pidof` on Linux
function throttle() { renice -n 19 -p `pgrep $1`; }
function nothrottle() { renice -n 0 -p `pgrep $1`; }
