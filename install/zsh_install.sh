#!/bin/sh

# install zsh
sudo apt install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

ZSH_CUSTOM=$HOME/.config/oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/changyuheng/zsh-interactive-cd.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-interactive-cd
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k


ZSHRC=~/.zshrc
if [ -f $ZSHRC ]; then 
    mv $ZSHRC $ZSHRC.old
fi

if [ ! -f $ZSHRC ]; then 
    echo 'if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then' > $ZSHRC
    echo '  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"' >>$ZSHRC
    echo 'fi' >> $ZSHRC

    echo 'export ZSH="${XDG_CONFIG_HOME:-$HOME/.config}/oh-my-zsh"' >> $ZSHRC
    echo 'export ZSH_DOT_DIR="$HOME/dotfiles/zsh"' >> $ZSHRC
    echo 'source $ZSH_DOT_DIR/zshrc' >> $ZSHRC
fi




