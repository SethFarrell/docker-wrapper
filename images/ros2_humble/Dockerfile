FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    ca-certificates \
    vim \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    gnupg \
    locales \
    lsb-release \
    software-properties-common \
    tmux \
 && rm -rf \var/lib/apt/lists/*

#ROS2-Humble installation
#RUN sudo apt-get update && sudo apt-get install -y locales
RUN sudo apt-get update
RUN sudo locale-gen en_US en_US.UTF-8
RUN sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

#RUN sudo apt install -y software-properties-common
RUN sudo add-apt-repository universe

#RUN sudo apt update -y && sudo apt install -y curl gnupg lsb-release
RUN sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/US
RUN apt-get install -y tzdata
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration

# Install development tools and ROS tools
RUN sudo apt update
RUN sudo apt install -y \
    python3 \
    python3-flake8-docstrings \
    python3-pip \
    python3-pytest-cov \
    ros-dev-tools

RUN sudo apt install -y \
    python3-flake8-blind-except \
    python3-flake8-builtins \
    python3-flake8-class-newline \
    python3-flake8-comprehensions \
    python3-flake8-deprecated \
    python3-flake8-import-order \
    python3-flake8-quotes \
    python3-pytest-repeat \
    python3-pytest-rerunfailures

# Systems needs to be upgraded before installing Humble due to a bug
# See warning on this page in the "Install ROS 2 packages" section
# https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html
RUN apt-get update
#RUN sudo apt update && sudo apt upgrade -y

RUN sudo apt-get install -y ros-humble-desktop
#RUN sudo apt-get install ros-humble-ros-base

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
#RUN sudo apt install -y python3-pip
RUN sudo apt-get install -y python3-colcon-common-extensions
RUN pip3 install -U argcomplete

RUN apt-get update
