#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Prompt
#PS1='[\u@\h \W]\$ '
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
PURPLE="\[$(tput setaf 5)\]"
WHITE="\[$(tput setaf 7)\]"

BOLD="\[$(tput bold)\]"
RESET="\[$(tput sgr0)\]"

PS1="${BOLD}${PURPLE}\W${YELLOW}⚡${WHITE}: ${GREEN}>${RESET} "

export PATH=$HOME/bin:$PATH
export TERM='screen-256color'
export EDITOR='nvim'

# some more aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lXr'
alias la='ls -laXr'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'
alias vim="nvim"
alias vi="nvim"
alias down='cd ~/Downloads'
alias docu='cd ~/Documents'
alias work='cd ~/workspace'

# gem
export PATH=$PATH:/root/.gem/ruby/2.5.0/bin

# fzf
source /usr/share/fzf/key-bindings.bash

# my scripts
[ -f "$HOME/git/dotfiles/scripts/fzf-git.sh" ] && source $HOME/git/dotfiles/scripts/fzf-git.sh
[ -f "$HOME/git/dotfiles/scripts/git-completion.bash" ] && source $HOME/git/dotfiles/scripts/git-completion.bash
[ -f "$HOME/git/dotfiles/scripts/git-aliases.bash" ] && source $HOME/git/dotfiles/scripts/git-aliases.bash

# bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh"  ]; then
    export GIT_PROMPT_ONLY_IN_REPO=1
    export GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
    export GIT_PROMPT_THEME="Custom"
    [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ] && source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

#autojump
[[ -s /home/alivs/.autojump/etc/profile.d/autojump.sh ]] && source /home/alivs/.autojump/etc/profile.d/autojump.sh
set -o noclobber
