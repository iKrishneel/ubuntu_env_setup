#!/usr/bin/env bash

alias roseus='rlwrap roseus'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias install='sudo apt-get install'



#ros
function rviz() {
    rosrun rviz rviz
}

function openni2() {
    roslaunch openni2_launch openni2.launch depth_registration:=true
}

function image_view() {
    rosrun image_view image_view image:=$1
}

function image_view2() {
    rosrun image_view2 image_view2 image:=$1
}

# ## make bash autocomplete with up arrow
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# ## make tab cycle through commands instead of listing
bind '"\t":menu-complete'

export EDITOR="emacs -nw"

export CAFFE_ROOT=$HOME/caffe
PYTHONPATH=/home/krishneel/caffe/python:$PYTHONPATH
export PYTHONPATH

DIGITS_ROOT=$HOME/digits

function thesiscd(){
    cd $HOME/Documents/phd_thesis
}


alias emacs='TERM=xterm; emacs -nw'


export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

##! for pytorch 
export CUDA_VISIBLE_DEVICES="0,1,2,3"

##! virtualenv
export WORKON_HOME=$HOME/.virtualenvs/env
# source $WORKON_HOME/bin/activate
