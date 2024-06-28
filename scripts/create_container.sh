#!/bin/bash
# Run "xhost +local:docker" in terminal before using launch script otherwise you cannot visualize applications in container
# docker run -it --net=host --env=DISPLAY "mount volumes" "image name" 

# Example Usage:
# bash create_container.sh ros:humble-perception test_container_name ~/ yes
if [ $1 = "-h" ]
then
echo "######################################################################"
echo "############################ Usage ###################################"
echo "######################################################################"
echo "### bash create_container.sh image_name container_name path_to_mount_in_container use_gpus[yes/no] ###"
echo "######################################################################"
echo "######################################################################"
exit
fi

# Provide access to xserver to docker
xhost +local:docker;

# Get arguments from command line
image_name=$1;
container_name=$2
volume_to_mount=$3;

# Check if the container already exists and remove it if it does
if [ "$(docker ps -aq -f name=$container_name)" ]; then
    echo "Container with name $container_name already exists. Removing it..."
    docker stop "$container_name" && docker rm "$container_name"
fi


use_gpus="--gpus all";
if [ $4 = "no" ]
then
use_gpus="";
fi

clear


docker run -d -v $volume_to_mount:/mounted_volume $use_gpus --net=host --env=DISPLAY -v /dev:/dev --group-add dialout --privileged=true --restart=always -w /mounted_volume --name $container_name $image_name sh -c "while true; do sleep 1000; done" && {
    # docker 
    docker exec -it "$container_name" bash -c "echo 'Container Created'; exit"
    # docker wait "$container_name"
    # docker stop "$container_name"
} || {
    echo "Error: Docker run command failed"
    xhost -local:docker;
    exit 1
}

clear

echo "######################################################################"
echo "################## You are now inside a container ####################"
echo "################## Image: $image_name "
echo "################## Container: $container_name "
echo "################## GPUS: $4 #########################################"
echo "######################################################################"

docker exec -it $container_name bash


echo "######################################################################"
echo "###################### Exiting Container #############################"
echo "################## Unsetting xhost+local:docker ######################"
xhost -local:docker;
echo "############################## Done ##################################"
