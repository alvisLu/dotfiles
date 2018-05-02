#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
#PS1='[\u@\h \W]\$ '
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
PURPLE="\[$(tput setaf 5)\]"
WHITE="\[$(tput setaf 7)\]"

BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"

PS1="${BOLD}${PURPLE}\W${YELLOW}ϟ${WHITE}: ${GREEN}>${RESET} "

# some more ls aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lXr'
alias la='ls -laXr'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -rf'

export PATH=$HOME/bin:$PATH
export TERM='screen-256color'
export EDITOR='nvim'
# gem
export PATH=$PATH:/root/.gem/ruby/2.5.0/bin

# nvm
source /usr/share/nvm/init-nvm.sh
# FZF
source /usr/share/fzf/key-bindings.bash

# my scripts
source $HOME/git/linux-environ-config/scripts/fzf-git.sh
source $HOME/git/linux-environ-config/scripts/git-completion.bash

