#!/bin/sh

# install zsh
sudo apt install zsh -y
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
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
    echo 'export ZSH="$HOME/.oh-my-zsh"' > $ZSHRC
    echo 'export ZSH_DOT_DIR="$HOME/dotfiles/zsh"' >> $ZSHRC
    echo 'source $HOME/dotfiles/zsh/zshrc' >> $ZSHRC
fi




