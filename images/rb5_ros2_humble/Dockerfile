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
RUN apt-get update
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

#RUN sudo apt install -y software-properties-common
RUN add-apt-repository universe

#RUN sudo apt update -y && sudo apt install -y curl gnupg lsb-release
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/US
RUN apt-get install -y tzdata
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration

# Install development tools and ROS tools
RUN apt update
RUN apt install -y \
    python3 \
    python3-pip \
    ros-dev-tools

# RUN apt install -y \
#     python3 \
#     python3-flake8-docstrings \
#     python3-pip \
#     python3-pytest-cov \
#     ros-dev-tools

# RUN sudo apt install -y \
#     python3-flake8-blind-except \
#     python3-flake8-builtins \
#     python3-flake8-class-newline \
#     python3-flake8-comprehensions \
#     python3-flake8-deprecated \
#     python3-flake8-import-order \
#     python3-flake8-quotes \
#     python3-pytest-repeat \
#     python3-pytest-rerunfailures

# Systems needs to be upgraded before installing Humble due to a bug
# See warning on this page in the "Install ROS 2 packages" section
# https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html
RUN apt update
RUN apt upgrade -y
#RUN sudo apt update && sudo apt upgrade -y

RUN apt install -y ros-humble-desktop
#RUN sudo apt-get install ros-humble-ros-base

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
#RUN sudo apt install -y python3-pip
RUN sudo apt-get install -y python3-colcon-common-extensions
RUN pip3 install -U argcomplete

RUN apt-get update

# For all homeworks
RUN python3 -m pip install megapi
RUN python3 -m pip install pyserial

# Add 'th.daemon = True' to the megapi python3 code so that when we ctrl-c the code, the motors will stop instead of keep running
# RUN sed -i $'86i\\\t\\\tth.daemon = True' /usr/local/lib/python3.10/dist-packages/megapi_python3.py

# # apriltags for Homework2+
RUN cd / && git clone https://github.com/AprilRobotics/apriltag.git
RUN cd /apriltag && cmake -B build -DCMAKE_BUILD_TYPE=Release
RUN cd /apriltag && cmake --build build --target install

# # install gstreamer for using hte onboard cameras
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


RUN apt-get install -y unzip && apt-get install -y wget && apt-get install -y build-essential checkinstall && apt-get install -y sudo
RUN apt-get install -y openssh-server usbutils
RUN apt-get install -y adb coreutils coreutils fakechroot fakeroot kmod libc6-arm64-cross qemu-user-static udev


# COPY /usr/lib /usr/lib

# RUN ln -s /opt/qcom/usr/bin/wcap-decode.weston /usr/bin/wcap-decode
# RUN ln -s /opt/qcom/usr/bin/weston-calibrator.weston /usr/bin/weston-calibrator
# RUN ln -s /opt/qcom/usr/bin/weston-clickdot.weston /usr/bin/weston-clickdot
# RUN ln -s /opt/qcom/usr/bin/weston-cliptest.weston /usr/bin/weston-cliptest
# RUN ln -s /opt/qcom/usr/bin/weston-dnd.weston /usr/bin/weston-dnd
# RUN ln -s /opt/qcom/usr/bin/weston-eventdemo.weston /usr/bin/weston-eventdemo
# RUN ln -s /opt/qcom/usr/bin/weston-flower.weston /usr/bin/weston-flower
# RUN ln -s /opt/qcom/usr/bin/weston-fullscreen.weston /usr/bin/weston-fullscreen
# RUN ln -s /opt/qcom/usr/bin/weston-image.weston /usr/bin/weston-image
# RUN ln -s /opt/qcom/usr/bin/weston-info.weston /usr/bin/weston-info
# RUN ln -s /opt/qcom/usr/bin/weston-multi-resource.weston /usr/bin/weston-multi-resource
# RUN ln -s /opt/qcom/usr/bin/weston-resizor.weston /usr/bin/weston-resizor
# RUN ln -s /opt/qcom/usr/bin/weston-scaler.weston /usr/bin/weston-scaler
# RUN ln -s /opt/qcom/usr/bin/weston-simple-egl.weston /usr/bin/weston-simple-egl
# RUN ln -s /opt/qcom/usr/bin/weston-simple-shm.weston /usr/bin/weston-simple-shm
# RUN ln -s /opt/qcom/usr/bin/weston-simple-touch.weston /usr/bin/weston-simple-touch
# RUN ln -s /opt/qcom/usr/bin/weston-smoke.weston /usr/bin/weston-smoke
# RUN ln -s /opt/qcom/usr/bin/weston-terminal.weston /usr/bin/weston-terminal
# RUN ln -s /opt/qcom/usr/bin/weston-stacking.weston /usr/bin/weston-stacking
# RUN ln -s /opt/qcom/usr/bin/weston-transformed.weston /usr/bin/weston-transformed
# RUN ln -s /opt/qcom/usr/bin/weston.weston /usr/bin/weston

# RUN ln -s /opt/qcom/usr/lib/libweston /usr/lib/libweston
# RUN ln -s /opt/qcom/usr/lib/libweston-3.so.0 /usr/lib/libweston-3.so.0
# RUN ln -s /opt/qcom/usr/lib/libweston-3.so.0.0.0 /usr/lib/libweston-3.so.0.0.0
# RUN ln -s /opt/qcom/usr/lib/libweston-desktop-3.so.0 /usr/lib/libweston-desktop-3.so.0
# RUN ln -s /opt/qcom/usr/lib/libweston-desktop-3.so.0.0.0 /usr/lib/libweston-desktop-3.so.0.0.0


# ADD /usr/lib/libweston-3 /usr/lib/libweston-3
# ADD /usr/lib/weston /usr/lib/weston