#!/usr/bin/env bash

if [ -z $VPN_CONF ]; then
    echo -e "\033[0;91mVPN_CONF path is required and it can be provided as follows\033[0m"
    echo -e "\033[0;91mexport VPN_CONF=/path/to/conf\033[0m"
    exit 1
fi

if [ ! -f $VPN_CONF ]; then
    echo -e "\033[0;91mInvalid file path: $VPN_CONF\033[0m"
    exit 1
fi

sudo apt install -y wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf
cd /tmp

FOLDER_NAME=network-manager-wireguard

[ ! -d $FOLDER_NAME ] && git clone https://github.com/max-moser/network-manager-wireguard.git $FOLDER_NAME
cd $FOLDER_NAME
./autogen.sh --without-libnm-glib
./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var
make -j`nproc` && sudo make install

sudo nmcli connection import type wireguard file $VPN_CONF

