docker run -d --privileged --name fchanane_router1 router
docker run -d --privileged --name fchanane_router2 router
#docker run -d --privileged --name fchanane_host1 alpine
#docker run -d --privileged --name fchanane_host2 alpine

docker cp conf/router1.sh fchanane_router1:/tmp/router1.sh
docker cp conf/router2.sh fchanane_router2:/tmp/router2.sh
#docker cp conf/host1.sh fchanane_host1:/tmp/host1.sh
#docker cp conf/host2.sh fchanane_host2:/tmp/host2.sh


docker exec fchanane_router1 chmod 777 /tmp/router1.sh
docker exec fchanane_router2 chmod 777 /tmp/router2.sh
#docker exec fchanane_host1 chmod 777 /tmp/host1.sh
#docker exec fchanane_host2 chmod 777 /tmp/host2.sh

docker exec -it fchanane_router1 bash -c "/tmp/router1.sh"
docker exec -it fchanane_router2 bash -c "/tmp/router2.sh"
#docker exec -it fchanane_host1 bash -c "/tmp/host1.sh"
#docker exec -it fchanane_host2 bash -c "/tmp/host2.sh"

docker exec -it fchanane_router1 ip addr show eth0
docker exec -it fchanane_router2 ip addr show eth0

