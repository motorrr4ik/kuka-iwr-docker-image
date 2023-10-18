ARG BASE_IMG
FROM ${BASE_IMG}
# FROM ros:foxy

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-ce"]

RUN mkdir -p /kuka_ws/src
WORKDIR /kuka_ws

RUN apt-get update && apt-get upgrade -y && apt install -y iputils-ping && apt install -y vim
RUN apt install -y ros-${ROS_DISTRO}-navigation2 && \
    apt install -y ros-${ROS_DISTRO}-gazebo-ros-pkgs && \ 
    apt install -y ros-${ROS_DISTRO}-moveit && \
    apt install -y ros-${ROS_DISTRO}-cartographer  && \
    apt install -y ros-${ROS_DISTRO}-rtabmap-ros && \
    apt install -y ros-${ROS_DISTRO}-teleop-twist-keyboard && \
    apt install -y ros-${ROS_DISTRO}-rqt-graph

RUN cd src && git clone https://github.com/ninamwa/kmriiwa_ws.git 
ADD ./param/ /kuka_ws/src/kmriiwa_ws/kmr_communication/param/

RUN cd src/kmriiwa_ws && \
    rm -rf kmr_behaviortree && \
    rm -rf kmr_manipulator && \
    rm -rf kmr_moveit2 && \
    rm -rf kmr_bringup && \
    rm -rf kmr_sunrise

RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
    && colcon build