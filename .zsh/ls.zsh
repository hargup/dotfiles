# Enable colorized output.
alias ls='ls --color=auto'

# Color scheme.
eval `dircolors ~/dotfiles/.zsh/bundle/dircolors-solarized/dircolors.256dark`

# Automatically list files after directory change.
autoload -U add-zsh-hook && {
  _ls_chpwd() {
    ls
  }
  add-zsh-hook chpwd _ls_chpwd
}

# Shortcuts for frequently used `ls` commands.
alias l='ls'
alias ll='ls -la'
