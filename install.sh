#!/bin/sh
# update sources
sudo apt update && apt upgrade -y

ZSHRC=~/.zshrc
if [ -f $ZSHRC ]; then 
    mv $ZSHRC $ZSHRC.old
fi

if [ ! -f $ZSHRC ]; then 
    # the '-' allows the heredoc to be indented 
    # the ' surrounding the delimeter leads to not expanding the $VARs in the multiline comment
	cat <<- 'EOF' > $ZSHRC
	[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME="$HOME/.config"
	[[ -z "$XDG_DATA_HOME" ]] && export XDG_DATA_HOME="$HOME/.local/share"
	export PATH=$HOME/.local/bin:/usr/local/bin:bin$PATH
	EOF
fi

# get path to this file
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo $SCRIPTPATH

# call isntall scripts
sh $SCRIPTPATH/install/zsh_install.sh
sh $SCRIPTPATH/install/python_install.sh
sh $SCRIPTPATH/install/utils_install.sh
sh $SCRIPTPATH/install/nvim_install.sh
