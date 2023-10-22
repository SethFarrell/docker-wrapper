FROM ubuntu:18.04

ENV ROS_DISTRO melodic
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# Install common software
RUN apt-get update
RUN apt-get install -y \
    curl \
    wget \
    ca-certificates \
    vim \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    gnupg \
    gnupg2 \
    lsb-release \
    python-pip \
    tmux \
 && rm -rf \var/lib/apt/lists/*

# ROS Melodic Installation
RUN sudo apt update && sudo apt install -y locales
RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US

RUN DEBIAN_FRONTEND=noninteractive TZ=America/US apt-get -y install tzdata
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration

RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

RUN sudo apt-get update
RUN DEBIAN_FRONTEND=noninteractive 
RUN sudo apt install -y ros-melodic-desktop
#RUN sudo apt install -y ros-melodic-ros-base
RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
# Install Rosdep
RUN sudo apt install -y python-rosdep
RUN sudo apt-get update

RUN rosdep init
RUN rosdep update

# Install additional packages for ROS (Add / Remove Packages as necessary for the application)
# RUN apt-get install -y \
#     ros-melodic-image-transport \
#     ros-melodic-image-transport-plugins \
#     ros-melodic-compressed-image-transport \
#     ros-melodic-compressed-depth-image-transport \
#     ros-melodic-sensor-msgs \
#     ros-melodic-vision-msgs \
#     ros-melodic-depth-image-proc \
#     python3-catkin-tools

####################

##### Other Requirements 
# RUN sudo apt-get update
# RUN apt-get install -y \
#     cmake \
#     gcc \
#     build-essential \
#     libpcl-dev \
#     libpcl-conversions-dev

