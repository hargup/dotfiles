os=`uname`
if   [[ $os == 'Darwin' ]]; then
  # let GNU coreutils installed by brew take preecedence on Mac systems
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi
