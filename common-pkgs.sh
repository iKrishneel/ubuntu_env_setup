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
     byobu \
     lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker ${USER}

sudo chmod +x /var/run/docker.sock

# nvidia
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
   && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - \
   && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-docker2 nvidia-container-toolkit
sudo systemctl restart docker

sudo snap install slack --classic
sudo snap install teams

# cpp linter
sudo pip3 install cpplint
