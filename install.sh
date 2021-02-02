#!/bin/sh
# update sources
sudo apt update && apt upgrade -y

# get path to this file
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo $SCRIPTPATH

# call isntall scripts
sh $SCRIPTPATH/install/zsh_install.sh
sh $SCRIPTPATH/install/python_install.sh
sh $SCRIPTPATH/install/utils_install.sh
sh $SCRIPTPATH/install/nvim_install.sh
