#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" # get path to this file

# install nvim as appimage (in sugguested location ${HOME}/Applications/ or ${HOME}/.local/bin/ or ${HOME}/bin/)
cd ~/.local/bin 
curl -LO https://github.com/neovim/neovim/releases/download/v0.7.2/nvim.appimage
chmod u+x nvim.appimage

# extract image to use it the same way in systems with and without fuse installed
./nvim.appimage --appimage-extract
ln -s squashfs-root/usr/bin/nvim nvim
cd -

pip3 install neovim
sudo npm install -g neovim

# configure nvim 
ln -s $SCRIPTPATH/../nvim/init.lua ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua
# create symlinks for files instead of complete lua dir. This allows to create additional configs 
# which are not port of this repo (e.g. private.lua)
ln -s $SCRIPTPATH/../nvim/lua/config ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/config
ln -s $SCRIPTPATH/../nvim/lua/commands.lua ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/commands.lua
ln -s $SCRIPTPATH/../nvim/lua/keymap.lua ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/keymap.lua
ln -s $SCRIPTPATH/../nvim/lua/options.lua /${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/options.lua
ln -s $SCRIPTPATH/../nvim/lua/plugins.lua /${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/plugins.lua

# get plugin manager and install plugins
sh -c 'git clone --depth 1 https://github.com/wbthomason/packer.nvim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/packer/start/packer.nvim'
~/.local/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 
