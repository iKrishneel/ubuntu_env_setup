#!/usr/bin/env bash

sudo cp -r /etc/default/keyboard /etc/default/keyboard.old
# sudo sed -i "s/XKBOPTIONS='""'/XKBOPTIONS='"'ctrl:nocaps'"'/g"
sudo sed -i 's/XKBOPTIONS=\"\"/XKBOPTIONS=\"ctrl:nocaps\"/g' /etc/default/keyboard
