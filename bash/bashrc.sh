#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# some more ls aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lXr'
alias la='ls -laXr'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vrf'

export PATH=$HOME/bin:$PATH

# tmux
export TERM="screen-256color"
# nvm
source /usr/share/nvm/init-nvm.sh
# FZF
source /usr/share/fzf/key-bindings.bash
# fzf-git
source $HOME/git/linux-environ-config/scripts/fzf-git.sh
