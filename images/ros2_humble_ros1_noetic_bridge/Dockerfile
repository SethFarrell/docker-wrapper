# Modified version of following docker file
# https://github.com/contradict/ros-humble-ros1-bridge/blob/main/Dockerfile

FROM ubuntu:jammy

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl gnupg lsb-release &&\
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
        -o /usr/share/keyrings/ros-archive-keyring.gpg &&\
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu jammy main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null &&\
    DEBIAN_FRONTEND=noninteractive apt-get update -y &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        build-essential \
        cmake \
        git \
        python3-flake8 \
        python3-flake8-blind-except \
        python3-flake8-builtins \
        python3-flake8-class-newline \
        python3-flake8-comprehensions \
        python3-flake8-deprecated \
        python3-flake8-docstrings \
        python3-flake8-import-order \
        python3-flake8-quotes \
        python3-pip \
        python3-pytest \
        python3-pytest-cov \
        python3-pytest-repeat \
        python3-pytest-rerunfailures \
        python3-rosdep2 \
        python3-setuptools \
        locales \
        wget \
        curl \
        ca-certificates \
        vim \
        sudo \
        bzip2 \
        libx11-6 \
        gnupg \
        lsb-release \
        software-properties-common \
        tmux 


# Setup for ROS2 Install
RUN python3 -m pip install -U colcon-common-extensions vcstool

RUN locale-gen en_US en_US.UTF-8 &&\
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ENV LANG=en_US.UTF-8

# Setup ROS2 workspace to build Humble from source
RUN mkdir -p /ros2_humble/src
WORKDIR /ros2_humble
RUN wget https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos
RUN vcs import src < ros2.repos
RUN rosdep update
RUN rosdep install --from-paths src --ignore-src -y --rosdistro humble \
      --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"
RUN colcon build --symlink-install


# Cleanup and install ROS1 Core 
RUN rm /etc/apt/sources.list.d/ros2.list &&\
    DEBIAN_FRONTEND=noninteractive apt-get update -y &&\
    DEBIAN_FRONTEND=noninteractive apt remove -y \
        python3-catkin-pkg python3-catkin-pkg-modules &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        ros-core-dev

# Make workspace for ROS Bridge and Build
RUN mkdir -p /ros1_bridge/src
WORKDIR /ros1_bridge
RUN git clone https://github.com/ros2/ros1_bridge
RUN /bin/bash -c ". /ros2_humble/install/local_setup.bash &&\
                  colcon build"

WORKDIR /
ENV ROS1_DISTRO=noetic
ENV ROS2_DISTRO=humble
#COPY ros_entrypoint.sh /
#ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
