#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" # get path to this file

BAT_VERSION=0.21.0
DELTA_VERSION=0.13.0
LAZYGIT_VERSION=0.36.0
RIPGREP_VERSION=13.0.0

mkdir -p ~/.local/bin

# install current version of bat
cd /tmp
curl -LO https://github.com/sharkdp/bat/releases/download/v$BAT_VERSION/bat_$BAT_VERSION\_amd64.deb
sudo dpkg -i bat_$BAT_VERSION\_amd64.deb
cd -

# install current version of delta
cd /tmp
curl -LO https://github.com/dandavison/delta/releases/download/$DELTA_VERSION/git-delta_$DELTA_VERSION\_amd64.deb
sudo dpkg -i git-delta_$DELTA_VERSION\_amd64.deb
cd -

# install current version of rpgrep a faster grep alternative
cd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/$RIPGREP_VERSION/ripgrep_$RIPGREP_VERSION\_amd64.deb
sudo dpkg -i ripgrep_*_amd64.deb
cd -

# install fd and create a symlink because the installed binary is named fdfind due to a name clash
sudo apt install fd-find -y
ln -s /usr/bin/fdfind ~/.local/bin/fd

# the --all argument will install all without confirmation
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ${XDG_CONFIG_HOME:-$HOME/.config}/fzf
${XDG_CONFIG_HOME:-$HOME/.config}/fzf/install --all --xdg

# install tmux and create a symlink to the config
sudo apt install tmux -y
ln -s $SCRIPTPATH/../tmux/tmux.conf ~/.tmux.conf

#tmux plugins
git clone https://github.com/tmux-plugins/tmux-yank $HOME/.config/tmux/tmux-yank
sudo apt install tmuxinator -y

sudo apt install exuberant-ctags

# Availabe ubuntu package is to old. Therefore get new nodjs sources before installinng. 
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install nodejs -y
sudo npm install --global yarn

sudo npm install -g tldr

# File Explorer
pip3 install ranger-fm

# install lazygit
cd /tmp
curl -LO https://github.com/jesseduffield/lazygit/releases/download/v$LAZYGIT_VERSION/lazygit_$LAZYGIT_VERSION\_Linux_x86_64.tar.gz
tar xvf lazygit_$LAZYGIT_VERSION\_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin/
ln -s ~/.local/bin/lazygit ~/.local/bin/lg

mkdir ${XDG_CONFIG_HOME:-$HOME/.config}/lazygit
ln -s $SCRIPTPATH/../lazygit/config.yml ${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/config.yml
ln -s $SCRIPTPATH/../lazygit/lg_nvim_config.yml ${XDG_CONFIG_HOME:-$HOME/.config}/lazygit/lg_nvim_config.yml
cd -
