# Save ZLE buffer to history on `Ctrl-C`.
#
# This lets me cancel the current command half way through and come back to it
# later.  I generally do this to quickly test an expansion or check/set the
# value of a variable when crafting a one liner, or to refer to man pages or
# git log for some quick info.
#
# The buffer is not saved if `Ctrl-C` is pressed when browsing through the
# history with `Ctrl-P`, `Ctrl-R`, etc.

TRAPINT () {
  zle && [[ $HISTNO -eq $HISTCMD ]] && print -rs -- $BUFFER
  return $1
}
