#!/usr/bin/env bash

sudo apt-get install wget

cd $HOME/Downloads
wget https://dllb2.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE2MTAyNTAwMTMiLCJ1IjpudWxsLCJsdCI6ImRvd25sb2FkIiwicyI6IjNlMmZmNmYxMzI4MTc4Y2Q5NzgxN2U2MTgyYTBjNGJiYmVlZTRmMjMyOGFlNDIxYWQ4NmE2NjczMjMyMWQ1MGNhZGY5ZGJmMGVmOWU2MzQ4NDQwYWIzNmVjZGIyNmQwMjg2YmRhNTJlOGEzMmY5NDRkN2Y4N2M1NDcwYjQyYWMwIiwidCI6MTYxODUwMDYyNCwic3RmcCI6ImQ1ZGRkN2ExMDA3NjhlMWVkMGJkZDQxNTQxMzZmM2ViIiwic3RpcCI6IjE1My4yMDIuMzIuMjIwIn0.pz-E9PQF41NAbf3TdbyGWC1Nl5WpDWRuRVJWrev_nkc/Solarized-Dark-Blue-3.36_2.0.4.zip

unzip Solarized-Dark-3.36.zip

sudo mv Solarized-Dark-* /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme "Solarized-Dark-Blue-3.36"
