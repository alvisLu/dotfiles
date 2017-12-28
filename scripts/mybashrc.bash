#
# ~/.bashrc
#

# some more ls aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lXr'
alias la='ls -laXr'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -rf'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# tmux
alias tmux="tmux -2" # supports 256 colors.
## autostart tmux
if [ -z "$TMUX" ]; then
    tmux
fi
