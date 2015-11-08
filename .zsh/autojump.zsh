# Setup auto jump.
# https://github.com/sjl/z-zsh

source $HOME/.zsh/bundle/autojump/z.sh
autoload -U add-zsh-hook && {
  _z_chpwd() {
    z --add "$(pwd -P)"
  }
  add-zsh-hook chpwd _z_chpwd
}
