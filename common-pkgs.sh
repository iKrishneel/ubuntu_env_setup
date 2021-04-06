#!/usr/bin/env bash


sudo -v
sudo apt-get update
sudo apt-get upgrade

## change caps to cntrl
setxkbmap -option caps:ctrl_modifier

sudo apt-get install -y \
     git \
     ssh \
     emacs \
     htop \
     net-tools \
     python3 \
     python3-pip \
     apt-transport-https \
     ca-certificates \
     curl \
     wget \
     gnupg \
     tmux \
     lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker ${USER}

sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
