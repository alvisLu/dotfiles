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
# # color ls for linux
# alias grep='grep --color=auto'
# alias ls='ls --color=auto'
# # color ls for mac
alias grep='grep -G'
alias ls='ls -G'

alias ll='ls -l'
alias la='ls -la'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'
alias vim="nvim"
alias vi="nvim"

# gem
export PATH=$PATH:/root/.gem/ruby/2.7.0/bin

# fzf
[ -f " /usr/share/fzf/key-bindings.bash" ] && source /usr/share/fzf/key-bindings.bash
[ -f "$HOME/.fzf.bash" ] && source $HOME/.fzf.bash

# my scripts
[ -f "$HOME/git/dotfiles/scripts/fzf/fzf-git.sh" ] && source $HOME/git/dotfiles/scripts/fzf/fzf-git.sh
[ -f "$HOME/git/dotfiles/scripts/git-completion.bash" ] && source $HOME/git/dotfiles/scripts/git-completion.bash
[ -f "$HOME/git/dotfiles/scripts/git-aliases.bash" ] && source $HOME/git/dotfiles/scripts/git-aliases.bash

# bash-git-prompt
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh"  ]; then
    export GIT_PROMPT_ONLY_IN_REPO=1
    export GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
    export GIT_PROMPT_THEME="Custom"
    [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ] && source "$HOME/.bash-git-prompt/gitprompt.sh"
fi

# autojump
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
set -o noclobber
