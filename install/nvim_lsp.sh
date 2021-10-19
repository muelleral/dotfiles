#!/bin/bash
sudo npm i -g pyright
sudo npm i -g bash-language-server
sudo npm i -g dockerfile-language-server-nodejs
sudo npm i -g vscode-langservers-extracted

sudo pip3 install cmake-language-server

sudo apt-get install clangd-12 -y
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100

sudo yarn global add yaml-language-server

