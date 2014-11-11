# Configure ZSH's completion system (man zshcompsys).

# List matches even if we have an unambiguous prefix.  This ensures list of
# matches is shown when fuzzy matching is used.  Consider the following case:
#
#   # when disabled
#   $ mplayer m/e/p<Tab>
#   $ mplayer Music/English/P<Tab>
#   Pink\ Floyd/    Poets\ of\ the\ Fall/    Porcupine\ Tree/    Puscifer/
#
#   # when enabled
#   $ mplayer m/e/p<tab>
#   $ mplayer Music/English/P
#   Pink\ Floyd/    Poets\ of\ the\ Fall/    Porcupine\ Tree/    Puscifer/
setopt   autolist
unsetopt listambiguous

setopt listpacked
setopt listtypes

# Scroll completion list that don't fit on the screen.
zstyle ':completion:*' list-prompt ''

zstyle ':completion:*' use-cache on

zstyle ':completion:*' completer _expand _complete _match _approximate
zstyle ':completion:*' matcher-list '+' '+m:{[:lower:]}={[:upper:]}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*:match:*' original only
zstyle -e ':completion:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:functions' ignored-patterns '_*'


# Path name completion.

cdpath=$HOME

# Ignore current directory and any ancestral directory from completion when
# path name contains '../'.
zstyle ':completion:*' ignore-parents 'parent pwd ..'

zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' expand suffix


zstyle ':completion::expand:*' tag-order 'expansions all-expansions'
zstyle ':completion:*' remove-all-dups true
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B%d:%b'
zstyle ':completion:*' verbose true

# Highlight prefix in bold blue and the rest in bold white.
zstyle -e ':completion:*' list-colors 'reply=("=(#bi)($PREFIX:t)*=$color[default];$color[bold]=$color[blue];$color[bold]:${(s.:.)LS_COLORS}")'

zstyle ':completion:*' prompt ''\''%e'\'''
zstyle ':completion:*:manuals' separate-sections true

# completion listing for processes (kill command)
zstyle ':completion::*:*:*:processes' command "ps -A --forest -w -w -o pid,user,cmd"
zstyle ':completion::*:*:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-zA-Z-_]#)*=01;34=0=01'

# Load additional completions from zsh-completions bundle.
[[ -d $HOME/.zsh/bundle/completions/src ]] && fpath=($HOME/.zsh/bundle/completions/src $fpath)

autoload -Uz compinit
compinit

# Shift-tab to menu complete backwards.
bindkey '^[[Z' reverse-menu-complete
