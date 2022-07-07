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

# get plugin manager, setup nvim config and install plugins
sh -c 'git clone --depth 1 https://github.com/wbthomason/packer.nvim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/packer/start/packer.nvim'
ln -s $SCRIPTPATH/../nvim/init.lua ~/.config/nvim/init.lua
ln -s $SCRIPTPATH/../nvim/lua ~/.config/nvim/lua
~/.local/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 

# create default local nvim config if none exists
LOCAL_VIMRC=~/.config/nvim/local.vim
if [ ! -f $LOCAL_VIMRC ]; then 
    PYTHON_PATH=$(which python3)
    echo "let g:python3_host_prog = '$PYTHON_PATH'" > $LOCAL_VIMRC
fi

