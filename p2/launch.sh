docker run -d --name fchanane_router1 router

docker cp conf/router1.sh fchanane_router1:/tmp/router1.sh

docker exec -it fchanane_router1 bash -c "/tmp/router1.sh"

docker exec -it fchanane_router1 ip addr show eth0

