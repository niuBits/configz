#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Original plain PS1
#PS1='[\u@\h \W]\$ '

## reload bashrc
alias loadbash='source ~/.bashrc'

## ls commands
if [ -f /usr/bin/ls ]; then
    alias ls='/usr/bin/ls --color=auto -F'
else
    alias ls='/bin/ls --color=auto -F'
fi
alias la='ls -a'
alias ll='ls -la'
alias lsc='/usr/bin/ls --color=always -F'
alias lac='lsc -a'
alias llc='lsc -la'

## grep
alias grep='grep --color=auto -n'
alias grepc='grep --color=always -n'

## less
alias less='less -R'

## tree
alias tree='/usr/bin/tree -lFC --dirsfirst'
alias tree_monochrome='/usr/bin/tree -lFn --dirsfirst'

## clear terminal
alias cls='echo -ne "\033c\033c"'

## colored cat
alias ccat='/usr/bin/pygmentize -g'

## colored diff
alias diff='/usr/bin/colordiff'

## transparent terminal
if [ -f /usr/bin/transset ]; then
    alias transset-df='transset'
fi
sleep 0.1 && [ -n "$XTERM_VERSION" ] && transset-df -a 0.90 >/dev/null

## set font & colorscheme for non-X session
if [ "$TERM" = "linux" ]; then
    setfont /usr/share/kbd/consolefonts/ter-120b.psf.gz
    echo -en "\e]P0000000" #black
    echo -en "\e]P83c3c3c" #darkgrey
    echo -en "\e]P1ff0000" #darkred
    echo -en "\e]P9ff5555" #red
    echo -en "\e]P264ff0a" #darkgreen
    echo -en "\e]PA9bff62" #green
    echo -en "\e]P3ffa50a" #brown
    echo -en "\e]PBffc562" #yellow
    echo -en "\e]P40a64ff" #darkblue
    echo -en "\e]PC629bff" #blue
    echo -en "\e]P5a50aff" #darkmagenta
    echo -en "\e]PDc562ff" #magenta
    echo -en "\e]P60affa5" #darkcyan
    echo -en "\e]PE62ffc5" #cyan
    echo -en "\e]P7d8d8d8" #lightgrey
    echo -en "\e]PFffffff" #white
    clear #for background artifacting
fi

## custom PS1 
if [ "$UID" -ne 0 ]
then
    if [ $(xrdb -q | grep Iosevka | wc -l) -eq 0 ]
    then
        export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    else
        export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \[\033[0m\]\[\033[30m\033[44m\]\356\202\260 \[\033[1;30m\033[44m\]\$ \[\033[0m\033[34m\033[40m\]\356\202\260\[\033[00m\] '
    fi
else
    export PS1='\[\033[01;31m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# force logout
alias logout='killall -u steven'

## lock screen
alias lockscreen="xscreensaver-command -lock"

## reboot computer
alias reboot="shutdown -r now"

## suspend computer
alias suspend="systemctl suspend"

## restart wired network
alias reconnect="sudo systemctl restart dhcpcd@enp0s25.service"

## Go Lang env var
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

## start IBus daemon
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx
