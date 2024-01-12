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

docker run -it -v /etc/ssh/sshd_config:/etc/ssh/sshd_config:rw -v /opt/qcom:/opt/qcom:rw -v /usr/lib:/usr/lib:rw -v /data/misc/wifi:/data/misc/wifi:rw -v ~:/home/workspace:rw -v /dev:/dev:rw -w /home/workspace --net=host --env=DISPLAY --group-add dialout --name rb5_container --privileged rb5:ros2_humble
# docker exec rb5_container ls /usr/bin | grep weston | awk 'system("ln -sf /opt/qcom/usr/bin/"$1".weston /usr/bin/"$1)'
# docker exec -it rb5_container bash
#docker exec -it -v /etc/ssh/sshd_config:/etc/ssh/sshd_config -v /data/misc/wifi:/data/misc/wifi:rw -v ~:/home/workspace:rw --env="QT_X11_NO_MITSHM=1" -v /tmp/.X11-unix:/tmp/.X11-unix:rw -w /home/workspace --net=host --env=DISPLAY -v /dev:/dev --group-add dialout --privileged rb5_container bash

echo "######################################################################"
echo "###################### Exiting Container #############################"
# echo "################## Unsetting xhost+local:docker ######################"
#xhost -local:docker;
#remove the container
docker container prune -f
echo "############################## Done ##################################"

# Clear the screen
#clear

echo "####################################################################################"
echo "####################################################################################"
echo "#### WARNING: YOU ARE NOT IN A CONTAINER, ANYTHING YOU CHANGE WILL BE PERMANENT ####"
echo "#### TO RE-ENTER A CONTAINER TYPE "source "~/".bashrc" #################################"
echo "####################################################################################"
