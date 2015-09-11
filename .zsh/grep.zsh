# Configure text filters (grep, head, tail).

# Use colored output in shells, and exclude .git/ when searching recursively.
export GREP_OPTIONS='--color=auto --exclude-dir=".git"'

# Convinience aliases to filter text output.
#
#   $ cat foobar G foo G bar
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
