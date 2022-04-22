#!/usr/bin/env bash

PROFILE=${HOME}/.profiles
cp -r .profiles ${PROFILE}

# create symlinks
[[ ! -f ${HOME}/.p10k.zsh ]] && ln -s ${PROFILE}/.p10k.zsh ${HOME}/.p10k.zsh
[[ ! -f ${HOME}/.emacs ]] && ln -s ${PROFILE}/.emacs ${HOME}/.emacs
[[ ! -d ${HOME}/.byobu ]] && ln -s ${PROFILE}/.byobu ${HOME}/.byobu

if ! grep -q "source ~/.p10k.zsh" ${HOME}/.zshrc; then
    printf '\n#powerlevel10k\nsource ~/.p10k.zsh\n' >> ${HOME}/.zshrc
fi

if ! grep -q 'alias emacs="emacs -nw"' $HOME/.zshrc; then
    printf '\nalias emacs="emacs -nw"\n' >> $HOME/.zshrc
fi

sed -i 's~\(ZSH_THEME="\)[^"]*\(".*\)~\1powerlevel10k/powerlevel10k\2~' ${HOME}/.zshrc

# profile
dconf load /org/gnome/terminal/legacy/profiles:/ < .profiles/gnome-terminal-profile.dconf
