#!/usr/bin/env bash

# first install go
export GO_VERISON=16.3
_FILENAME=go1.${GO_VERISON}.linux-amd64.tar.gz

cd /tmp
if [[ ! -f $_FILENAME ]]
then
    wget https://golang.org/dl/$_FILENAME
fi

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $_FILENAME

# echo "PATH=\$PATH:/usr/local/go/bin" >> ${HOME}/.zshrc 

echo $(go version)
echo "Installing CLI"

if [[ ! -d cli ]]
then
    git clone https://github.com/cli/cli.git
fi

cd cli
export PATH=$PATH:/usr/local/go/bin
make -j$(nproc)
sudo make install -j$(nproc)
