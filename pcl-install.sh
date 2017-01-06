
cd $HOME
FILE=pcl

echo "CLONING PCL"

git clone https://github.com/PointCloudLibrary/pcl.git $FILE
cd $HOME/pcl
mkdir build
cd build

echo "BUILDING PCL"
cmake -DBUILD_simulation=ON -DBUILD_examples=ON -DBUILD_CUDA=ON -DBUILD_GPU=ON -DBUILD_TESTS=ON -DBUILD_cuda_apps=ON -DBUILD_cuda_common=ON -DBUILD_cuda_features:=ON -DBUILD_cuda_io:=ON -DBUILD_cuda_sample_consensus=ON  -DBUILD_cuda_segmentation:=ON -DBUILD_gpu_containers=ON -DBUILD_gpu_features=ON -DBUILD_gpu_kinfu=ON -DBUILD_gpu_kinfu_large_scale=ON -DBUILD_gpu_octree=ON -DBUILD_gpu_people=ON -DBUILD_gpu_segmentation=ON -DBUILD_gpu_surface=ON -DBUILD_gpu_segmentation=ON -DBUILD_gpu_tracking=ON -DBUILD_gpu_utils=ON -DBUILD_global_tests=ON ..
