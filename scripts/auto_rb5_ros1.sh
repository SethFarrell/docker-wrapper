#!/bin/bash
# Run "xhost +local:docker" in terminal before using launch script otherwise you cannot visualize applications in container
# docker run -it --net=host --env=DISPLAY "mount volumes" "image name" 
# echo "######################################################################"
# echo "############################ Usage ###################################"
# echo "######################################################################"
# echo "### bash launch_script.sh image_name volume_name use_gpus [yes/no] ###"
# echo "######################################################################"
# echo "######################################################################"

# if [ $1 = "-h" ]
# then
# exit
# fi

# Provide access to xserver to docker
#xhost +local:docker;

#clear

# echo "######################################################################"
# echo "################## You are now inside a container ####################"
# echo "################## Image: $image_name "
# echo "################## GPUS: $3 ##########################################"
# echo "######################################################################"

# Returns true if a docker container with the specified name does NOT exist
# [ ! "$(docker ps -a | grep <name>)" ]

docker run -it -v /etc:/etc:rw -v /data/misc/wifi:/data/misc/wifi:rw -v ~:/home/workspace:rw -v /dev:/dev:rw -w /home/workspace --net=host --env=DISPLAY --group-add dialout --privileged rb5:ros1_melodic

echo "######################################################################"
echo "###################### Exiting Container #############################"
# echo "################## Unsetting xhost+local:docker ######################"
#xhost -local:docker;
#remove the container
docker container prune -f
echo "############################## Done ##################################"

# Clear the screen
clear

echo "####################################################################################"
echo "####################################################################################"
echo "#### WARNING: YOU ARE NOT IN A CONTAINER, ANYTHING YOU CHANGE WILL BE PERMANENT ####"
echo "#### TO RE-ENTER A CONTAINER TYPE "source "~/".bashrc" #################################"
echo "####################################################################################"
