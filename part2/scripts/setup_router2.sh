#first setup the ip addr for the interface eth0
ip addr add 10.1.1.2/24 dev eth0

#create the bridge interface
ip link add br0 type bridge

#set the new interface to up
ip link set dev br0 up

#configure the vxlan interface
ip link add name vxlan10 type vxlan id 10 dev eth0 local 10.1.1.2 remote 10.1.1.1 dstport 4789

#set the interface as up
ip link set dev vxlan10 up

#add eth1 to the bridge
brctl addif br0 eth1

#add vxlan10 to the bridge
brctl addif br0 vxlan10

