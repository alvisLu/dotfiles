#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Automatically start xfce4
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startxfce4
fi
