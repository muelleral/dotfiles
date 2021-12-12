#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )" # get path to this file

# install nvim as appimage (in sugguested location ${HOME}/Applications/ or ${HOME}/.local/bin/ or ${HOME}/bin/)
cd ~/.local/bin 
curl -LO https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage
chmod u+x nvim.appimage

# extract image to use it the same way in systems with and without fuse installed
./nvim.appimage --appimage-extract
ln -s squashfs-root/usr/bin/nvim nvim
cd -

pip3 install neovim
sudo npm install -g neovim

# get plugin manager, setup nvim config and install plugins
sh -c 'git clone https://github.com/k-takata/minpac.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim/pack/minpac/opt/minpac'
ln -s $SCRIPTPATH/../nvim/init.vim ~/.config/nvim/init.vim
ln -s $SCRIPTPATH/../nvim/config ~/.config/nvim/config
~/.local/bin/nvim --headless +"call minpac#update()" +qa

# create default local nvim config if none exists
LOCAL_VIMRC=~/.config/nvim/local.vim
if [ ! -f $LOCAL_VIMRC ]; then 
    PYTHON_PATH=$(which python3)
    echo "let g:python3_host_prog = '$PYTHON_PATH'" > $LOCAL_VIMRC
fi

