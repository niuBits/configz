#
# ~/.bash_profile
#

# ver. arch
# single line for sourcing bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# ver. ubuntu
## if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi

# ver. ubuntu
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa &> /dev/null

# start xcompmgr only if awesome is the selected WM
run_composite_manager () {
    local x_pid=$( pidof X )
    if [ ${#x_pid} -gt 0 ] ; then
        # autostart xcompmgr only if awesome is the selected WM
        if [ "$GDMSESSION" = "awesome" ]; then
            xcompmgr -c &
        fi
        xscreensaver &
        devilspie -a &
    else
        [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
    fi
}
run_composite_manager
