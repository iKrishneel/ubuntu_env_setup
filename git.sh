#!/usr/bin/env bash

sudo npm i -g gh gitmoji-cli diff-so-fancy

# git configuration
# force use ssh
git config --global url."git@github.com:".insteadOf "https://github.com/" 
# git config --global commit.gpgSign true
