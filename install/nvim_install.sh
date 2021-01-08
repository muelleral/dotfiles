#!/bin/sh

# install nvim as appimage (in sugguested location ${HOME}/Applications/ or ${HOME}/.local/bin/ or ${HOME}/bin/)
cd ~/.local/bin 
curl -LO https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
cd -
chmod u+x ~/.local/bin/nvim.appimage
ln -s ~/.local/bin/nvim.appimage ~/.local/bin/nvim

pip3 install neovim

# create a symLink to the nvim configuration
nvim --headless +"call mkdir(stdpath('config'), 'p')" +"exe 'edit '.stdpath('config').'/init.vim'" +qa
ln -s ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
ln -s ~/dotfiles/nvim/coc.vim ~/.config/nvim/coc.vim

# create default local nvim config if none exists
LOCAL_VIMRC=~/.config/nvim/local.vim
if [ ! -f $LOCAL_VIMRC ]; then 
    PYTHON_PATH=$(which python3)
    echo "let g:python3_host_prog = '$PYTHON_PATH'" > $LOCAL_VIMRC
fi

# get plugin manager and install plugins
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa

# Configure CoC
sudo apt install nodejs -y
sudo apt install npm -y

# nodejs >= 10 required. ubuntu 18.04 provides only 8. 
# use "curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -" to get required version
sudo npm install -g neovim


#install coc extensions 
nvim --headless "+CocInstall coc-python" +qa
nvim --headless "+CocInstall coc-yank" +qa

