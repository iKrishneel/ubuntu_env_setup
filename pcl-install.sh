#!/usr/bin/env bash

function pcl-deps() {
    sudo apt-get install -y libflann-dev libeigen3-dev libgtest-dev libvtk6-dev libusb-dev libusb-1.0-0-dev libqhull-dev libpcap-dev libopenni2-dev libopenni-sensor-primesense-dev libopenni-dev libvtk6-qt-dev libproj-dev
}

function install-pcl() {
    cd $HOME
    FILE=pcl

    pcl-deps
    
    if [ ! -d $FILE ];
    then
    echo "CLONING PCL"
    git clone https://github.com/PointCloudLibrary/pcl.git $FILE
    else
	cd $FILE
	git fetch --all
	git pull --all
    fi
    
    cd $HOME/pcl
    if [ -d build ];
    then
	rm -rf build
    fi
    mkdir build
    cd build

    echo "BUILDING PCL"
    cmake -DBUILD_simulation=ON -DBUILD_examples=ON -DBUILD_CUDA=ON -DBUILD_GPU=ON -DBUILD_TESTS=ON -DBUILD_cuda_apps=ON -DBUILD_cuda_common=ON -DBUILD_cuda_features:=ON -DBUILD_cuda_io:=ON -DBUILD_cuda_sample_consensus=ON  -DBUILD_cuda_segmentation:=ON -DBUILD_gpu_containers=ON -DBUILD_gpu_features=ON -DBUILD_gpu_kinfu=ON -DBUILD_gpu_kinfu_large_scale=ON -DBUILD_gpu_octree=ON -DBUILD_gpu_people=ON -DBUILD_gpu_segmentation=ON -DBUILD_gpu_surface=ON -DBUILD_gpu_segmentation=ON -DBUILD_gpu_tracking=ON -DBUILD_gpu_utils=ON -DBUILD_global_tests=ON ..

    make -j8
    sudo make install -j8
}

install-pcl
