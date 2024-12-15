# Driver script to configure all running containers

for cont_id in $(docker ps -q); do

    # Get the container's hostname

    current_hostname=$(docker exec $cont_id hostname)

    echo "Configuring container: $current_hostname"

    

    # Configure hosts (fchanane_host-1, fchanane_host-2, fchanane_host-3)

    if [[ "$current_hostname" =~ ^fchanane_host-[1-3]$ ]]; then

        echo "Configuring Host $current_hostname"

        docker cp ./conf/host_config.sh $cont_id:/host_config.sh  # Copy host config script

        docker exec $cont_id /bin/sh /host_config.sh  # Execute host config script

    

    # Configure leaf routers (fchanane-2, fchanane-3, fchanane-4)

    elif [[ "$current_hostname" =~ ^fchanane-[2-4]$ ]]; then

        echo "Configuring Leaf $current_hostname"

        docker cp ./conf/leaf_config.sh $cont_id:/leaf_config.sh  # Copy leaf router config script

        docker exec $cont_id bash /leaf_config.sh  # Execute leaf router config script

    

    # Configure spine router (fchanane-1)

    elif [[ "$current_hostname" =~ ^fchanane-1$ ]]; then

        echo "Configuring Spine $current_hostname"

        docker cp ./conf/spine_config.sh $cont_id:/spine_config.sh  # Copy spine router config script

        docker exec $cont_id bash /spine_config.sh  # Execute spine router config script

    

    # Handle unknown container types

    else

        echo "Unknown container type: $current_hostname"

    fi

done

