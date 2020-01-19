#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Automatically start xfce4
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  #exec startxfce4
  exec startx
fi

# ruby
PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$HOME/
