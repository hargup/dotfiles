# Update terminal's title to reflect the command being executed or the current
# working directory.

autoload -U add-zsh-hook && {
  _title_precmd() {
    # set terminal's title to the current working directory
    _title ${PWD}
  }

  _title_preexec() {
    # set terminal's title to the command that is going to be run
    _title ${1%%% *}
  }

  add-zsh-hook precmd _title_precmd
  add-zsh-hook preexec _title_preexec
}
