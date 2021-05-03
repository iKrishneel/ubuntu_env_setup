#!/usr/bin/env bash


function install-cuda {
    # manually change this based on the version

    if [ $(lsb_release -rs) != 20.04 ]
    then
	echo -e "\033[031m The installation script is only for Ubuntu 20.04.\033[0m"
	return
    fi
    
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
    wget https://developer.download.nvidia.com/compute/cuda/11.3.1/local_installers/cuda-repo-ubuntu2004-11-3-local_11.3.1-465.19.01-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu2004-11-3-local_11.3.1-465.19.01-1_amd64.deb
    sudo apt-key add /var/cuda-repo-ubuntu2004-11-3-local/7fa2af80.pub
    sudo apt-get update
    sudo apt-get install -y cuda
}

install-cuda
