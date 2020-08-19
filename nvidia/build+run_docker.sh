#!/bin/bash


sudo docker build --tag nvidia-image-glcudavulkan:2.0 .
sudo docker run --name devtest2 --rm -v /media/evan/Ophiun/Graphics:/D-drive --gpus all -it nvidia-image-glcudavulkan:2.0 sh