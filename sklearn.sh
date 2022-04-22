#!/usr/bin/env bash

function sklearn() {
    sudo pip install -U scikit-image

    sudo apt-get install build-essential python-dev python-setuptools \
	 python-numpy python-scipy \
	 libatlas-dev -y
    sudo apt-get install python-matplotlib -y
    sudo pip install -U scipy scikit-learn
}

sklearn
