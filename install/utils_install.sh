#!/bin/sh
sudo apt install silversearcher-ag -y
sudo apt install bat -y
sudo apt install fd-find -y

# the --all argument will install all without confirmation
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

sudo apt install exuberant-ctags
