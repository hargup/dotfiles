# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ulimit -Sv 5000000

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="random"
ZSH_THEME="juanghurtado"

alias rm="rm -i"
alias youtube-dl="youtube-dl --restrict-filename"
alias xclip="xclip -selection clipboard"
alias asearch="sudo apt-cache search"
alias ainstall="sudo apt-get install search"
alias halt="sudo shutdown -h"
alias reboot="sudo shutdown -r"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export VMAIL_VIM=gvim

# added by Anaconda 2.0.1 installer
export PATH="/home/hargup/anaconda/bin:$PATH"
# source activate py3.4
xrandr --output HDMI1 --mode 1920x1080 --left-of LVDS1
xrandr --output LVDS1 --mode 1366x768 --right-of HDMI1 

export http_proxy="http://10.3.100.207:8080/"
export https_proxy="https://10.3.100.207:8080/"
export ftp_proxy="ftp://10.3.100.207:8080/"
export HTTP_PROXY="http://10.3.100.207:8080/"
export HTTPS_PROXY="https://10.3.100.207:8080/"
export FTP_PROXY="ftp://10.3.100.207:8080/"
export PYTHONPATH
