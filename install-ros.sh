#!/usr/bin/env bash

function install-ros() {
    sudo -v
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

    version=melodic
    
    sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

    sudo apt-get update
    sudo apt-get install ros-$version-desktop-full -y

    sudo rosdep init
    rosdep update

    source /opt/ros/melodic/setup.bash

    sudo apt-get install python-rosinstall
    sudo apt-get install python-catkin-tools
}


function rosws() {
    DIR=~/ros/melodic/src
    mkdir -p $DIR

    cd $DIR
    git clone https://github.com/ros-perception/vision_opencv.git
    git clone https://github.com/ros-perception/image_common.git
    git clone https://github.com/ros-perception/image_pipeline.git

    source /opt/ros/melodic/setup.bash
    cd ..
    catkin_init_workspace

    catkin build
    
    printf '\nsource ~/ros/melodic/devel/setup.bash' >> ~/.bashrc
}

install-ros
rosws
