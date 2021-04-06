#!/usr/bin/env bash

function install-fonts {

    sudo apt-get update -y && sudo apt-get install -y fonts-font-awesome git
    
    cd /tmp/
    if [[ ! -d nerd-fonts ]]
    then
	git clone https://github.com/ryanoasis/nerd-fonts.git
	./nerd-fonts/install.sh
    fi

    FONT_HOME=~/.local/share/fonts

    echo "installing fonts at $PWD to $FONT_HOME"
    mkdir -p "$FONT_HOME/adobe-fonts/source-code-pro"
    # find "$FONT_HOME" -iname '*.ttf' -exec echo '{}' \;

    (git clone \
	 --branch release \
	 --depth 1 \
	 'https://github.com/adobe-fonts/source-code-pro.git' \
	 "$FONT_HOME/adobe-fonts/source-code-pro" && \
	 fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")

    if [[ ! -d fonts ]]
    then
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts
	./install.sh
	cd ..
	rm -rf fonts
    fi
}

install-fonts
