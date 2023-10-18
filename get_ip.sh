#!/bin/bash
mkdir -p param
touch param/bringup.yaml
IP=$(hostname -I | cut -f1 -d' ')
echo "kmp_statusdata_node:
  ros__parameters:

    port: 30001
    KMR1/ip: ${IP}
    KMR2/ip: ${IP}

kmp_commands_node:
  ros__parameters:

    port: 30002
    KMR1/ip: ${IP}
    KMR2/ip: ${IP}

kmp_laserscan_node:
  ros__parameters:

    port: 30003
    KMR1/ip: ${IP}
    KMR2/ip: ${IP}

kmp_odometry_node:
  ros__parameters:

    port: 30004
    KMR1/ip: ${IP}
    KMR2/ip: ${IP}

lbr_commands_node:
  ros__parameters:

    port: 30005
    KMR1/ip: ${IP}
    KMR2/ip: ${IP}

lbr_statusdata_node:
  ros__parameters:

    port: 30006
    KMR1/ip: ${IP}
    KMR2/ip: ${IP}

lbr_sensordata_node:
  ros__parameters:

    port: 30007
    KMR1/ip: ${IP}
    KMR2/ip: ${IP}" > param/bringup.yaml