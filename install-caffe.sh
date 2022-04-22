#!/usr/bin/evn BASH

# Copyright (C) 2016 by Krishneel Chaudhary @ JSK Lab, The University
# of Tokyo, Japan

function install-glog {
    /bin/echo -e "\e[1;32m[LOG] Installing GLOG \e[0m"
    
    ipwd=$PWD
    cd /tmp/
    FILE=glog

    if [ ! -d /tmp/$FILE ]; 
    then
	git clone https://github.com/google/glog.git
	cd $FILE
    else
	cd $FILE
	git pull origin master
    fi
    
    mkdir -p build 
    cd build

    /bin/echo -e "\e[1;32m[LOG] Building GLOG \e[0m"
    cmake -DCMAKE_CXX_FLAGS=-fpic ..
    make -j8

    /bin/echo -e "\e[1;32m[LOG] Installing GLOG \e[0m"
    sudo make install -j8
    /bin/echo -e "\e[1;32m[LOG] Successfully install GLOG \e[0m"

    cd /tmp/
    rm -rf $FILE
    cd $ipwd
}

function install-gflags {
    /bin/echo -e "\e[1;32m[LOG] Installing GFLAGS \e[0m"

    ipwd=$PWD
    cd /tmp/
    FILE=gflags

    if [ ! -d /tmp/$FILE ]; 
    then
	git clone https://github.com/gflags/gflags.git	
	cd $FILE
    else
	cd $FILE
	git pull origin master
    fi
    
    mkdir -p build 
    cd build

    /bin/echo -e "\e[1;32m[LOG] Building GFLAGS \e[0m"
    cmake -DCMAKE_CXX_FLAGS=-fpic ..
    make -j8

    /bin/echo -e "\e[1;32m[LOG] Installing GFLAGS \e[0m"
    sudo make install -j8
    /bin/echo -e "\e[1;32m[LOG] Successfully install GFLAGS \e[0m"
    
    cd /tmp/
    rm -rf $FILE
    
    cd $ipwd
}

function install-caffe {
    /bin/echo -e "\e[1;32mCloning Caffe into the home directory\e[0m"
    cd $HOME
    FILE=caffe

    if [ ! -d $HOME/$FILE ]; 
    then
	git clone https://github.com/BVLC/caffe.git 
	cd $FILE
    else
	cd $FILE
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	if [ $branch == "master"]
	then
	    git pull origin master
	fi
    fi
    mkdir -p build 
    cd build
    
    cmake -DCUDA_USE_STATIC_CUDA_RUNTIME=OFF ..

    /bin/echo -e "\e[1;32mCompiling Caffe\e[0m"
    make -j8 all
    
    /bin/echo -e "\e[1;32mRunning Caffe Tests\e[0m"
    make -j8 runtest
    
    /bin/echo -e "\e[1;35m Caffe Installation completed... \e[0m"
}

function install-caffe-deps {
    sudo apt-get update -y
    sudo apt-get install cmake \
	libprotobuf-dev libleveldb-dev libsnappy-dev \
	libhdf5-serial-dev protobuf-compiler \
	libatlas-base-dev liblmdb-dev python-dev python-numpy -y
    sudo apt-get install --no-install-recommends libboost-all-dev -y
}

function main {
    printf "\e[1;31m[LOG: %s:%s]: Installing caffe on TX1 \e[0m\n" \
	"$(date)" "$(hostname)"
    sudo -v
    
    install-glog
    install-gflags
    install-caffe-deps
    install-caffe

    printf '\n\n# Caffe Root\nexport CAFFE_ROOT=$HOME/caffe\n' >> ~/.bashrc
    printf 'export PYTHONPATH=$HOME/caffe/python:$PYTHONPATH\n' >> ~/.bashrc  
}

main

