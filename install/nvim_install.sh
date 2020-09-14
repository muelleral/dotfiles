#!/bin/sh

sudo apt install neovim -y
sudo apt install nodejs -y
sudo apt install npm -y

sudo npm install -g neovim

# create a symLink to the nvim configuration
nvim --headless +"call mkdir(stdpath('config'), 'p')" +"exe 'edit '.stdpath('config').'/init.vim'" +qa
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# get plugin manager and install plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa

# Configure CoC
nvim --headless "+CocInstall coc-python" +qa

