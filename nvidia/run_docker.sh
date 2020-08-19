#!/bin/bash

# --name imagename 
# --rm -> remove image after closing 
# -v add my D-drive to be accessible for Docker 

sudo docker run --name devtest2 --rm -v /media/evan/Ophiun/Graphics:/D-drive --gpus all -it nvidia-image-glcudavulkan:2.0 sh