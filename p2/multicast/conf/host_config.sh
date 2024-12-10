#!/bin/bash

# Extract the last digit of the hostname (1 or 2)
host_id=$(hostname | rev | cut -d '-' -f 1 | rev)

# Configure the network for the host
ip addr add 30.1.1.$host_id/24 dev eth1

