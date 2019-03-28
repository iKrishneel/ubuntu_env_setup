#!/usr/bin/env bash

function lamp-install() {
    ipwd=$PWD

    sudo apt-get update && sudo apt-get upgrade -y
    sudo apt-get install -y tasksel
    sudo tasksel install lamp-server
    sudo apt-get apache2
    #https://linode.com/docs/web-servers/lamp/install-lamp-stack-on-ubuntu-16-04/
}

lamp-install
