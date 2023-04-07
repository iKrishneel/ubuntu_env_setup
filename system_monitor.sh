sudo apt-get install -y gnome-tweaks tree gettext

cd /tmp/
git clone https://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git system_monitor
sudo apt-get install -y gir1.2-gtop-2.0 gir1.2-nm-1.0 gir1.2-clutter-1.0 gnome-system-monitor
cd system_monitor
make install
gnome-extensions enable system-monitor@paradoxxx.zero.gmail.com
gnome-shell-extension-tool --enable-extension=system-monitor@paradoxxx.zero.gmail.com
gnome-extensions enable system-monitor@paradoxxx.zero.gmail.com
