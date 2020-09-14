#!/bin/sh
# update sources
sudo apt update
sudo apt upgrade -y

# call isntall scripts
sh install/zsh_install.sh
sh install/python_install.sh
sh install/utils_install.sh
sh install/nvim_install.sh
