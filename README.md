# homelinux
Custom linux config files

# Bash

- Before you do anything else you **have to** append the .bashrc to your ~/.bashrc file:

`cat .bashrc >> ~/.bashrc`

This will source all bash related files like aliases and prompt

# Stow

We will use stow to link the dotfiles to our home folder.

- First install stow:

```sh
# Debian
sudo apt install stow
# Redhat
sudo dnf install stow
```

- By default stow links files to the parent working directory. We need to pass `-t` in order to set `$HOME` as the target dir:

`stow -t ~ bash git nano tmux nvim`

The above command will link the files inside `stow/{bash,git,nano,tmux,nvim}` to `$HOME`.

# Tmux

To take advantage of the current tmux configuration file please first install Tmux Plugin Manager (TPM):

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Key Bindings:

`prefix` + `I`

- Install new plugins

`prefix` + `U`

- Update plugin(s)

`prefix` + `alt` + `u`

- Remove/uninstall plugins not on the plugin list
