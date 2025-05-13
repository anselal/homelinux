##############################
# CUSTOM CODE BY soulis.tech #
##############################

umask 077

HISTSIZE= HISTFILESIZE= # Infinite history

export EDITOR=/usr/bin/vim
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export TERM='xterm-256color'


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

test -s ~/.bash_aliases && source ~/.bash_aliases || true
test -s ~/.bash_aliases_rpi && source ~/.bash_aliases_rpi || true
test -s ~/.bash_prompt && source ~/.bash_prompt || true

# make caps lock behave as escape
# command -v setxkbmap >/dev/null 2>&1 && setxkbmap -option caps:escape
