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
alias ls='/usr/bin/ls --color=auto -F'
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
alias tree='/usr/bin/tree -lhFC --dirsfirst'
alias tree_monochrome='/usr/bin/tree -lhFn --dirsfirst'

## clear terminal
alias cls='echo -e "\033c"'

## colored cat
alias ccat='/usr/bin/pygmentize -g'

## colored diff
alias diff='/usr/bin/colordiff'

## transparent terminal
sleep 0.1 && [ -n "$XTERM_VERSION" ] && transset-df -a 0.75 >/dev/null

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
    export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
else
    export PS1='\[\033[01;31m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

## lock screen
alias lockscreen="xscreensaver-command -lock"

## reboot computer
alias reboot="shutdown -r now"

