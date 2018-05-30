# homelinux
Custom linux config files

# powerline

taken from https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin

- **Install using pip or pip3:**

```sh
$ sudo su -c 'pip3 install git+git://github.com/Lokaltog/powerline'
```

- **font installation:**

```sh
$ wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
$ sudo mv PowerlineSymbols.otf /usr/share/fonts/
$ sudo fc-cache -vf /usr/share/fonts/
$ sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```

- **Bash prompt:** append to ~/.bashrc or /etc/bash.bashrc (set python version)

```sh
if [ -f /usr/local/lib/python3.6/dist-packages/powerline/bindings/bash/powerline.sh ]; then
    source /usr/local/lib/python3.6/dist-packages/powerline/bindings/bash/powerline.sh
fi
```

- **Vim statusline:** append to ~/.vimrc or /etc/vim/vimrc:

```sh
set rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
```

- **Tmux statusline:** append to ~/.tmux.conf:

```sh
source /usr/local/lib/python3.6/dist-packages/powerline/bindings/tmux/powerline.conf
set-option -g default-terminal "screen-256color"
```

