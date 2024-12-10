#!/bin/bash

# Extract the last digit of the hostname (1 or 2)
router_id=$(hostname | rev | cut -d '-' -f 1 | rev)

# Configure the router's primary IP address
ip addr add 10.1.1.$router_id/24 dev eth0

# Set up VXLAN
ip link add name vxlan10 type vxlan id 10 dev eth0 \
    local 10.1.1.$router_id remote 10.1.1.$((3-$router_id)) dstport 4789

ip addr add 20.1.1.$router_id/24 dev vxlan10

ip link set dev vxlan10 up


ip link add br0 type bridge

ip link set dev br0 up

brctl addif br0 eth1

brctl addif br0 vxlan10

