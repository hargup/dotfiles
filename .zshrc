# Hooks
typeset -ga chpwd_functions
typeset -ga precmd_functions
typeset -ga preexec_functions

# Initialize convinience mappings for ANSI colors codes.
autoload -Uz colors
colors

# zsh options; man zshoptions
setopt extendedglob
setopt notify
setopt correct
setopt interactivecomments
setopt multios

setopt autocd
setopt autopushd
setopt pushdignoredups
setopt pushdsilent

# Let background jobs run even after shell is closed.
setopt nohup

# Automatically display system resource usage summary for commands that took
# more than 5s to run.
REPORTTIME=5

unsetopt flowcontrol
unsetopt beep


### Key bindings ###
bindkey -e
bindkey '^[/' undo

zle -N rationalize-dot
bindkey . rationalize-dot


### Aliases
alias df='df -h'
alias du='du -hs'

alias pi='sudo aptitude install'
alias pr='sudo aptitude remove'
alias pp='sudo aptitude purge'
alias pud='sudo aptitude update'
alias pug='sudo aptitude safe-upgrade'
alias pufg='sudo aptitude full-upgrade'
alias pse='aptitude search'
alias psh='aptitude show'

alias halt='sudo shutdown -h now'
alias reboot='sudo reboot'

alias -g Y='| xclip && xclip -o | xclip -se c'
alias -g R='$(git rev-parse --show-toplevel 2> /dev/null)'

rc=$HOME/.zsh
if [ -f $rc/*([1]) ]; then
  for script in $rc/*; do
    source $script
  done
fi

fpath=($HOME/.zsh/functions $fpath)
autoload -U $HOME/.zsh/functions/*(:t)
