#!/usr/bin/env bash

sudo apt-get install -y gnome-tweaks tree gettext

cd /tmp/
git clone https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git gnome-shell-system-monitor-applet
sudo apt-get install -y gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 gnome-system-monitor
cd gnome-shell-system-monitor-applet
make install
gnome-extensions enable system-monitor@paradoxxx.zero.gmail.com
gnome-shell-extension-tool --enable-extension=system-monitor@paradoxxx.zero.gmail.com
gnome-extensions enable system-monitor@paradoxxx.zero.gmail.com

/bin/echo -e "\033[33mHint: Add GNOME version to $HOME/.local/share/gnome-shell/extensions/system-monitor@paradoxxx.zero.gmail.com/metadata.json\033[0m"
