HISTSIZE= HISTFILESIZE= # Infinite history

export EDITOR=/usr/bin/vim
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export TERM='xterm-256color'

if [ -d ~/bin ]; then
    export PATH=$PATH:~/bin
fi

test -s ~/.bash_aliases && source ~/.bash_aliases || true
test -s ~/.bash_aliases_rpi && source ~/.bash_aliases_rpi || true
test -s ~/.bash_prompt && source ~/.bash_prompt || true

