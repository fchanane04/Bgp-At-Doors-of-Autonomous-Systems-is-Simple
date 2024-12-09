#!/bin/bash

# Pull the required Docker images
echo "Pulling Alpine image..."
docker pull alpine

echo "Pulling FRRouting image..."
docker pull frrouting/frr

# Run FRRouting container in the background
echo "Starting FRRouting container..."
docker run -d --name frr-container frrouting/frr

# Modify the /etc/frr/daemons file
echo "Modifying /etc/frr/daemons..."
docker exec -it frr-container bash -c "sed -i 's/bgpd=no/bgpd=yes/' /etc/frr/daemons"
docker exec -it frr-container bash -c "sed -i 's/ospfd=no/ospfd=yes/' /etc/frr/daemons"
docker exec -it frr-container bash -c "sed -i 's/isisd=no/isisd=yes/' /etc/frr/daemons"

# Commit the changes to a new image called 'router'
echo "Committing changes to a new Docker image 'router'..."
docker commit frr-container router

# Clean up by stopping and removing the container
echo "Stopping and removing the container..."
docker stop frr-container
docker rm frr-container

# Deleting the original frr docker image
docker rmi frrouting/frr

# Script completion message
echo "Docker image 'router' created successfully."
