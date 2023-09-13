FROM ubuntu:18.04

ENV ROS_DISTRO melodic
# ENV NVIDIA_VISIBLE_DEVICES \
#     ${NVIDIA_VISIBLE_DEVICES:-all}
# ENV NVIDIA_DRIVER_CAPABILITIES \
#     ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

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
    python3 \
    python3-pip \
    tmux \
 && rm -rf \var/lib/apt/lists/*

# ROS Noetic Installation
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

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc


####################

##### Other Requirements 
RUN sudo apt-get update
RUN apt-get install -y \
    cmake \
    gcc \
    build-essential \
    libpcl-dev \
    libpcl-conversions-dev \
    python3-catkin-tools

# For all homeworks
RUN python3 -m pip install megapi
RUN python3 -m pip install pyserial

# # apriltags for Homework2+
# RUN cd / && git clone https://github.com/AprilRobotics/apriltag.git
# RUN cd /apriltag && cmake -B build -DCMAKE_BUILD_TYPE=Release
# RUN cd /apriltag && cmake --build build --target install

RUN apt-get update && apt-get install -y \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-bad1.0-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    gstreamer1.0-tools \
    gstreamer1.0-x \
    gstreamer1.0-alsa \
    gstreamer1.0-gl \
    gstreamer1.0-gtk3 \
    gstreamer1.0-qt5 \
    gstreamer1.0-pulseaudio

