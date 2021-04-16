#!/usr/bin/env bash

sudo apt-get install python3-venv

python3 -m venv ${HOME}/pyvenv

source $HOME/pyvenv/bin/activate
pip3 install ipython numpy opencv-python scikit-learn numba matplotlib tabulate pillow
