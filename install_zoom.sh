#/usr/bin/env bash

if [ "$EUID" -ne 0 ]; then
    # If not running as root, re-run the script with sudo
    sudo "$0" "$@"
    exit $?
fi

apt-get install -y libgl1-mesa-dev libgl1-mesa-glx

wget https://zoom.us/client/5.15.10.6882/zoom_amd64.deb -P $HOME/Downloads/
dpkg -i $HOME/Downloads/zoom_amd64.deb
rm -rf $HOME/Downloads/zoom_amd64.deb
