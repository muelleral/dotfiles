#!/bin/sh

mkdir -p ~/.local/bin

# install bat and create a symlink because the installed binary is named batcat due to a name clash
sudo apt install bat -y
ln -s /usr/bin/batcat ~/.local/bin/bat

# install fd and create a symlink because the installed binary is named fdfind due to a name clash
sudo apt install fd-find -y
ln -s /usr/bin/fdfind ~/.local/bin/fd

# the --all argument will install all without confirmation
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# install tmux and create a symlink to the config
sudo apt install tmux -y
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
sudo apt install tmuxinator -y

# install a faster grep alternative
sudo apt install silversearcher-ag -y

sudo apt install exuberant-ctags
