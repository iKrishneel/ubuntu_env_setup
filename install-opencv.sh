#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev gfortran cmake libavresample-dev libgphoto2-dev libgstreamer1.0-dev libprotobuf-c-dev libprotobuf-dev libgoogle-glog-dev libswscale-dev libopenblas-dev libdc1394-22-dev libgstreamer-opencv1.0-0 libgtk3.0-cil-dev -y

sudo add-apt-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install ffmpeg

sudo apt-get install git
git clone git@github.com:Itseez/opencv_contrib.git ${HOME}/opencv_contrib
git clone git@github.com:Itseez/opencv.git ${HOME}/opencv

mv ${HOME}/opencv_contrib ${HOME}/opencv

cd ${HOME}/opencv/
mkdir build && cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=OFF -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=OFF -D WITH_OPENGL=OFF -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D WITH_CUBLAS=1 -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules ..  

sudo make -j8
sudo make install -j8

echo "\033[32m OPENCV IS INSTALLED \033[0m"

#update system var
sudo tee -a /etc/ld.so.conf.d/opencv.conf  
sudo ldconfig  
# printf '# OpenCV\nPKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig\nexport PKG_CONFIG_PATH\n' >> ~/.bashrc  
source ~/.bashrc  
