#!/usr/bin/env bash

sudo apt-get install wget

cd $HOME/Downloads
rm -rf Solarized-Dark-Blue*

wget https://dl3.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MTAyNTAwMTMiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6Ijg3N2FmYzllOTM4Nzk4OTBiZmNmNGY5YmViZmMzYWQyNDk5M2MxYWRlNjVmMmU2NmRiZmIzZGQ0MjQxZmI4MDdlZjgwYWQwYzRiNWJmY2E2MDYxMjQzNTdkZWVmMzM5OGRlZGNlMmViMjQzMjhiMzI1MTE3NDM4OTEwN2E5YTA1IiwidCI6MTYzNDEyOTY4Miwic3RmcCI6ImNjYTVlNDdmZjk4NjkzZjNhMDcyYTE4YmZhNWNmNjJlIiwic3RpcCI6IjE1My4yMDIuMzIuMjIwIn0.W9RQy4yra4RV1Lrx6YGiGl9K6WSYE5QAXgZ6e_ehjuE/Solarized-Dark-Blue-3.36_2.0.4.zip -O Solarized-Dark-Blue.zip

unzip Solarized-Dark-Blue.zip
mv Solarized-Dark-Blue-* Solarized-Dark-Blue

sudo mv Solarized-Dark-Blue /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme "Solarized-Dark-Blue"
