# Configure less.

# Default options/flags for less.
#
# Use a verbose prompt, Vim like 'smartcase' search, and interpret color codes
# and escape sequences.
export LESS='-M -i -R'

# Display multi-byte characters.
export LESSCHARSET=utf-8

# Remember upto 1000 history items.
export LESSHISTSIZE=1000

# Use less as the standard pager.
export PAGER=less

# Use less for viewing man pages.
export MANPAGER=$PAGER

# Conveniently pipe to less by appending 'L' to the command.
alias -g L='| less'
