HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt sharehistory
setopt histignoredups
setopt histignorealldups
setopt histfindnodups
setopt histignorespace

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
