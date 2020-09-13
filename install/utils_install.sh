#!/bin/sh
sudo apt install silversearcher-ag -y
sudo apt install bat -y
sudo apt install fd-find -y
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
