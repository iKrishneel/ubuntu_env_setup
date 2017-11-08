#!/usr/bin/env bash


sudo -v
sudo apt-get update
sudo apt-get upgrade

## change caps to cntrl
setxkbmap -option caps:ctrl_modifier

sudo apt-get install git ssh emacs24 -y

sudo apt-get install python-pip -y
sudo pip install --upgrade pip
sudo pip install numpy==1.11
sudo pip install ipython

## latex
sudo apt-get  install texlive-full -y

##
sudo apt-get install libboost-all-dev -y

#! protobuf
sudo apt-get install python-pip -y
sudo pip install protobuf

#! tbb-lib
sudo apt-get install libtbb-dev -y

sudo apt-get install libeigen3-dev libflann-dev -y


##! others
sudo apt-get install -y htop
