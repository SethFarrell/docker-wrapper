#!/bin/bash
# Run "xhost +local:docker" in terminal before using launch script otherwise you cannot visualize applications in container
# docker run -it --net=host --env=DISPLAY "mount volumes" "image name" 
echo "######################################################################"
echo "############################ Usage ###################################"
echo "######################################################################"
echo "### bash launch_script.sh image_name volume_name use_gpus [yes/no] ###"
echo "######################################################################"
echo "######################################################################"

if [ $1 = "-h" ]
then
exit
fi

# Provide access to xserver to docker
xhost +local:docker;

# Get arguments from command line
image_name=$1;
volume_to_mount=$2;

use_gpus="--gpus all";
if [ $3 = "no" ]
then
use_gpus="";
fi

clear

echo "######################################################################"
echo "################## You are now inside a container ####################"
echo "################## Image: $image_name "
echo "################## GPUS: $3 ##########################################"
echo "######################################################################"

docker run -it -v $volume_to_mount:/mounted_volume $use_gpus --net=host --env=DISPLAY $image_name

echo "######################################################################"
echo "###################### Exiting Container #############################"
echo "################## Unsetting xhost+local:docker ######################"
xhost -local:docker;
echo "############################## Done ##################################"
