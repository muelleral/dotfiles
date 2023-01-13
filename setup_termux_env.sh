#!/bin/bash

# Other settings
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" # get path to this file

# configure nvim 
mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua #make sure folder exists
ln -sf $SCRIPTPATH/nvim/init.lua ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/init.lua
# create symlinks for files instead of complete lua dir. This allows to create additional configs 
# which are not port of this repo (e.g. private.lua)
ln -sf $SCRIPTPATH/nvim/lua/config ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/config
ln -sf $SCRIPTPATH/nvim/lua/commands.lua ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/commands.lua
ln -sf $SCRIPTPATH/nvim/lua/keymap.lua ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/keymap.lua
ln -sf $SCRIPTPATH/nvim/lua/options.lua /${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/options.lua
ln -sf $SCRIPTPATH/nvim/lua/plugins.lua /${XDG_CONFIG_HOME:-$HOME/.config}/nvim/lua/plugins.lua

# get plugin manager and install plugins
sh -c 'git clone --depth 1 https://github.com/wbthomason/packer.nvim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/packer/start/packer.nvim'
# ~/.local/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 
# $SCRIPTPATH/install/nvim_install.sh

ln -sf $SCRIPTPATH/termux/termux $HOME/.termux
ln -sf $SCRIPTPATH/termux/shortcuts $HOME/.shortcuts
