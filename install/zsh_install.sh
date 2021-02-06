#!/bin/sh
ZSH=${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-zsh
ZSH_CUSTOM=$ZSH/custom

# install zsh
sudo apt install zsh -y
chsh -s $(which zsh)
git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/changyuheng/zsh-interactive-cd.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-interactive-cd
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k


ZSHRC=~/.zshrc
if [ -f $ZSHRC ]; then 
    # the '-' allows the heredoc to be indented 
    # the ' surrounding the delimeter leads to not expanding the $VARs in the multiline comment
	cat <<- 'EOF' >> $ZSHRC
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	[[ -z "$ZSH" ]] && export ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-zsh"
	[[ -z "$ZSH_CUSTOM" ]] && export ZSH_CUSTOM="$ZSH/custom"
	[[ -z "$ZSH_DOT_DIR" ]] && export ZSH_DOT_DIR="$HOME/dotfiles/zsh"
	
	source $ZSH_DOT_DIR/zshrc
	EOF
fi
