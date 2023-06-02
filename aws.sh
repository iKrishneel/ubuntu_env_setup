#!/usr/bin/env bash

cd $HOME/Downloads
mkdir aws && cd aws
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

rm -rf $HOME/Downloads/aws
