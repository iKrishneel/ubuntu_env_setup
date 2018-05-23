#!/usr/bin/env bash 

function poweline-install() {
    ipwd=$PWD
    DIR=/tmp/powerline
    if [ ! -d $DIR ];
    then	
	git clone https://github.com/powerline/powerline.git $DIR
    else
	cd $DIR
	git fetch --all
	git pull --all
    fi
    cd $DIR
    python setup.py build
    sudo python setup.py install

    cd $ipwd
    rm -rf $DIR
}

function powerline-fonts() {
    ipwd=$PWD
    DIR=/tmp/fonts
    if [ ! -d $DIR ];
    then
	git clone https://github.com/powerline/fonts.git $DIR
    else
	cd $DIR
	git fetch --all
	git pull --all
    fi
    
    cd $DIR
    chmod +x install.sh
    ./install.sh
    
    cd $ipwd
    rm -rf $DIR
    
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
    mv PowerlineSymbols.otf $HOME/.local/share/fonts/
    sudo fc-cache -vf $HOME/.local/share/fonts/

    mkdir -p $HOME/.config/fontconfig/conf.d/
    mv 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/
}

function poweline-shell() {
    ipwd=$PWD
    if [ ! -d $DIR ];
    then 
	git clone https://github.com/iKrishneel/powerline-shell.git ~/.powerline-shell
    else
	cd ~/.powerline-shell
	git fetch --all
	git pull --all
    fi
    cd ~/.powerline-shell
    python install.py build
    sudo python install.py install

    printf '\n\n#! powerline-shell\nfunction _update_ps1() {\n\tPS1="$(~/.powerline-shell/powerline-shell.py $? 2> /dev/null)"\n}\nexport PROMPT_COMMAND="_update_ps1"\n\n' >> ~/.bashrc    
}


poweline-install
powerline-fonts
poweline-shell
