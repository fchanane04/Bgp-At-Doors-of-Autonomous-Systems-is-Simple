#!/bin/bash



# Get the host's ID from its hostname

host_id=$(hostname | rev | cut -d '-' -f 1 | rev)



# Configure the IP address for the host (range 30.1.1.x)

ip addr add 30.1.1.$host_id/24 dev eth0

