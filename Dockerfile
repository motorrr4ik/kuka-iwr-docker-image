ARG BASE_IMG
ARG ROS_DISTRO
FROM ${BASE_IMG}
# FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-ce"]

RUN mkdir -p /kuka_ws/src
WORKDIR /kuka_ws


RUN rm /etc/apt/sources.list.d/ros2-snapshots.list &&\
    apt update && apt install -y curl &&\
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg &&\
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt-get update && apt-get upgrade -y && apt install -y iputils-ping && apt install -y vim 
RUN apt install -y ros-${ROS_DISTRO}-navigation2 && \
    apt install -y ros-${ROS_DISTRO}-nav2-bringup &&\
    apt install -y ros-${ROS_DISTRO}-gazebo-ros-pkgs && \ 
    apt install -y ros-${ROS_DISTRO}-moveit && \
    apt install -y ros-${ROS_DISTRO}-cartographer  && \
    apt install -y ros-${ROS_DISTRO}-rtabmap-ros && \
    apt install -y ros-${ROS_DISTRO}-teleop-twist-keyboard && \
    apt install -y ros-${ROS_DISTRO}-rqt-graph

RUN cd src && git clone https://github.com/motorrr4ik/kmriiwa_ws.git
ADD ./param/ /kuka_ws/src/kmriiwa_ws/kmr_communication/param/

RUN cd src/kmriiwa_ws && \
    rm -rf kmr_behaviortree && \
    rm -rf kmr_manipulator && \
    rm -rf kmr_moveit2 && \
    # rm -rf kmr_bringup && \
    rm -rf kmr_sunrise

RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
    && colcon build