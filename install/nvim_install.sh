#!/bin/sh

# install nvim as appimage (in sugguested location ${HOME}/Applications/ or ${HOME}/.local/bin/ or ${HOME}/bin/)
cd ~/.local/bin 
curl -LO https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
cd -
chmod u+x ~/.local/bin/nvim.appimage
ln -s ~/.local/bin/nvim.appimage ~/.local/bin/nvim

sudo apt install nodejs -y
sudo apt install npm -y

sudo npm install -g neovim

pip3 install neovim
# create a symLink to the nvim configuration
nvim --headless +"call mkdir(stdpath('config'), 'p')" +"exe 'edit '.stdpath('config').'/init.vim'" +qa
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# get plugin manager and install plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa

# Configure CoC
#nvim --headless "+CocInstall coc-python" +qa

