#!/bin/sh

# install nvim as appimage (in sugguested location ${HOME}/Applications/ or ${HOME}/.local/bin/ or ${HOME}/bin/)
cd ~/.local/bin 
curl -LO https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod u+x nvim.appimage
ln -s nvim.appimage nvim
cd -

pip3 install neovim

# create a symLink to the nvim configuration
nvim --headless +"call mkdir(stdpath('config'), 'p')" +"exe 'edit '.stdpath('config').'/init.vim'" +qa
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/config ~/.config/nvim/config

# create default local nvim config if none exists
LOCAL_VIMRC=~/.config/nvim/local.vim
if [ ! -f $LOCAL_VIMRC ]; then 
    PYTHON_PATH=$(which python3)
    echo "let g:python3_host_prog = '$PYTHON_PATH'" > $LOCAL_VIMRC
fi

# get plugin manager and install plugins
sh -c 'git clone https://github.com/k-takata/minpac.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim/pack/minpac/opt/minpac'
nvim --headless +"call minpac#update()" +qa


# Configure CoC
# Coc requires current verion of nodejs. Availabe ubuntu package is to old. Therefore get new nodjs sources before
# installinng. 
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -

sudo apt install nodejs -y
sudo apt install npm -y
sudo npm install -g neovim
