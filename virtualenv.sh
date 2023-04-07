#/usr/bin/env bash

sudo apt-get install -y python3-virtualenv
virtualenv -p python3 $HOME/pyenv

pip install numpy matplotlib ipython pre-commit
