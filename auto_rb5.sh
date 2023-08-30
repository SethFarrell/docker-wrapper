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
xhost +local:docker;

#clear

# echo "######################################################################"
# echo "################## You are now inside a container ####################"
# echo "################## Image: $image_name "
# echo "################## GPUS: $3 ##########################################"
# echo "######################################################################"

docker run -it -v /etc/ssh/sshd_config:/etc/ssh/sshd_config -v /data/misc/wifi:/data/misc/wifi:rw -v ~:/home/workspace:rw --env="QT_X11_NO_MITSHM=1" -v /tmp/.X11-unix:/tmp/.X11-unix:rw -w /home/workspace --net=host --env=DISPLAY -v /dev:/dev --group-add dialout --privileged ros2:humble_test

echo "######################################################################"
echo "###################### Exiting Container #############################"
# echo "################## Unsetting xhost+local:docker ######################"
xhost -local:docker;
echo "############################## Done ##################################"
