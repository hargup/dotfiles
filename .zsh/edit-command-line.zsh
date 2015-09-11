# Edit current command in $EDITOR
#
# ref: man zshcontrib
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line
