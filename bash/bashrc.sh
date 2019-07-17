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

# some more aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lXr'
alias la='ls -laXr'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'


export PATH=$HOME/bin:$PATH
export TERM='screen-256color'
export EDITOR='nvim'
# gem
export PATH=$PATH:/root/.gem/ruby/2.5.0/bin

# nvm
source /usr/share/nvm/init-nvm.sh
# fzf
source /usr/share/fzf/key-bindings.bash

# my scripts
[ -f "$HOME/git/linux-environ-config/scripts/fzf-git.sh" ] && source $HOME/git/linux-environ-config/scripts/fzf-git.sh
[ -f "$HOME/git/linux-environ-config/scripts/git-completion.bash" ] && source $HOME/git/linux-environ-config/scripts/git-completion.bash

# mapacode scripts
[ -f "$HOME/scripts/mapacode.bash" ] && source $HOME/scripts/mapacode.bash

# bash-git-prompt
export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
export GIT_PROMPT_THEME="Custom"
[ -f "$HOME/.bash-git-prompt/gitprompt.sh" ] && source "$HOME/.bash-git-prompt/gitprompt.sh"

#autojump
set -o noclobber

