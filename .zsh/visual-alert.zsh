# Echo visual bell (\a) after command finished executing (technically, before
# the prompt is re-drawn).  Most terminals relay this to the window manager
# causing the terminal window to be highlighted in the taskbar if it doesn't
# have focus.

autoload -U add-zsh-hook && {

  _visual_alert_precmd() {
    # send a visual bell to the terminal
    echo -ne '\a'
  }

  add-zsh-hook precmd _visual_alert_precmd
}
