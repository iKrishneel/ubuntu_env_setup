#!/usr/bin/env bash

cd ./profiles

# emacs profile
cp -r emacs $HOME/.emacs

# create alias
grep 'alias emacs="emacs -nw"' $HOME/.zshrc && \
    sed -i 's/alias emacs="*"/alias emacs="emacs -nw"/g' $HOME/.zshrc || \
	echo 'alias emacs="emacs -nw"' >> $HOME/.zshrc

# profile
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal-profile.dconf
