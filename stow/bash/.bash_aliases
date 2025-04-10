# Default linux aliases
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias grep='grep --color'
alias l='ls --color'
alias la='ls -al --color'
alias ll='ls -l --color'
alias xl='tailf ~/.kodi/temp/kodi.log'
alias xll='less ~/.kodi/temp/kodi.log'
alias xlll='while :; do tailf ~/.kodi/temp/kodi.log; done'

# Custom aliases
alias kairos='curl http://wttr.in/thessaloniki'
alias dumax='du -h --max-depth=1 2> /dev/null | sort -h -r | head -n20'
alias rmempty='find . -type d -empty -delete'
alias octal="stat -c '%a %n'"
# Usage octal * (for all files)
#       octal hello.txt (for a specific file)

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# Folder shortcuts
alias down='cd ~/Downloads'
alias antmon='cd ~/Projects/github/anselal/antminer-monitor'
alias homelinux='cd ~/Projects/github/anselal/homelinux'

# Upgrade
alias upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove && sudo apt-get clean'
alias upgrade-fast='sudo apt-fast update && sudo apt-fast upgrade -y'
alias upgrade-kernel='sudo zypper dist-upgrade -r kernel-repo'
alias pip_upgrade='pip list --outdated | sed "s/(.*//g" | xargs pip install -U'
alias upgrade-pihole="sudo curl -sSL https://install.pi-hole.net | bash"

# Flex
alias flex='flexget execute --tasks SHOWRSS move_tvshows --now'
alias flexmove='flexget execute --tasks move_tvshows --now'

# Docker aliases
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

# Networking
alias openports='sudo netstat -tulp' # optionally pass -n
alias openconnections='sudo netstat -tupn'

# xrandr
alias vga='xrandr --auto --output VGA-1 --mode 1920x1080 --right-of LVDS-1'
alias dp='xrandr --auto --output DP-1 --mode 1920x1080 --right-of LVDS-1'

# Git
alias c="clear && git status"
alias d="git diff $1"

# Hugo
alias hs="hugo server --noHTTPCache --disableFastRender"

# Stow
alias stow="stow -t ~"

# Easy file sharing from the command line
transfer() {
    if [ $# -eq 0 ]; then
        echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
        return 1;
    fi
    tmpfile=$( mktemp -t transferXXX );
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
    fi;
    cat $tmpfile;
    rm -f $tmpfile;
}

function slog() {
    if [ "$#" -eq 0 ]; then
        clear; tail /var/log/syslog
    elif [ "$#" -eq 1 ]; then
        clear; grep $1 /var/log/syslog | tail
    fi
}

function recgrep() {
    if [ "$#" -eq 0 ]; then
        echo "argumenmts: location optional(), text to search"
    elif [ "$#" -eq 1 ]; then
        grep -rnw '.' -e "$1"
    elif [ "$#" -eq 2 ]; then
        grep -rnw $1 -e "$2"
    fi
}

function recreplace() {
    if [ "$#" -eq 0 ]; then
        echo -e "arguments: location, extension eg. *.inc, text to find, text to replace"
    elif [ "$#" -eq 4 ]; then
        find $1 -type f -name "$2" -print0 | xargs -0 sed -i '' -e 's/$3/$4/g'
    fi
}
