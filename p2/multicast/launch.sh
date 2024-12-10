#!/bin/bash

# Driver script to configure all running containers
for cont_id in $(docker ps -q); do
    # Get the container's hostname
    current_hostname=$(docker exec $cont_id hostname)
    
    if [[ "$current_hostname" =~ ^fchanane_host-[1-2]$ ]]; then
        echo "Configuring $current_hostname with host_config.sh"
        docker cp ./conf/host_config.sh $cont_id:/host_config.sh
        docker exec $cont_id /bin/sh /host_config.sh
    elif [[ "$current_hostname" =~ ^fchanane_router-[1-2]$ ]]; then
        echo "Configuring $current_hostname with router_config.sh"
        docker cp ./conf/router_config.sh $cont_id:/router_config.sh
        docker exec $cont_id bash /router_config.sh
    else
        echo "Unknown container type: $current_hostname"
    fi
done

