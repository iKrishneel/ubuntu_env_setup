#!/usr/bin/env bash

_FILENAME=${HOME}/.backgrounds/black_ubuntu_20_04.png

if [[ ! -d ${_FILENAME%/*} ]]
then
    mkdir -p ${_FILENAME%/*}
fi

if [[ ! -f $_FILENAME ]]
then
    wget -O $_FILENAME  https://www.ubuntufree.com/wp-content/uploads/2020/04/Black-Ubuntu-20-04-Default-Wallpaper.png
fi

gsettings set org.gnome.desktop.background picture-uri file://${_FILENAME}
gsettings set org.gnome.desktop.background picture-uri-dark file://${_FILENAME}
