#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
