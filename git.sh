#!/usr/bin/env bash

sudo apt-get install git
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# git configuration
# force use ssh
git config --global url."git@github.com:".insteadOf "https://github.com/" 
# git config --global commit.gpgSign true
