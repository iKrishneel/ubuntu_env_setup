#!/usr/bin/env bash

sudo apt-get install curl zsh -y

if [[ ! -d $HOME/.oh-my-zsh ]]
   then
       sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

_POWERLEVEL10K=$ZSH_CUSTOM/themes/powerlevel10k

if [[ ! -d $_POWERLEVEL10K ]]
then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    
fi


# install ohmyzsh plugins
cd ${HOME}/.oh-my-zsh/custom/plugins

if [[ ! -d zsh-autosuggestions ]]
then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git
fi

if [[ ! -d zsh-completions ]]
then
    git clone https://github.com/zsh-users/zsh-completions.git
fi

if [[ ! -d zsh-syntax-highlighting ]]
then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi

if [[ ! -d git-open ]]
then
    git clone https://github.com/paulirish/git-open.git
fi

# replace the line
sed -i 's/plugins=(git)/plugins=(git git-open zsh-autosuggestions zsh-syntax-highlighting zsh-completions colored-man-pages colorize docker github)/g' ${HOME}/.zshrc
