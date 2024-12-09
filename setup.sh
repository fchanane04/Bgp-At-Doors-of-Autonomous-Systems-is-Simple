#installation of GNS3
add-apt-repository ppa:gns3/ppa
apt update
apt install gnome-session-flashback
apt install gns3-gui

#installation of docker
apt install docker.io
usermod -aG docker $USER

#install D-Bus tool to avoid dbus-launch error
apt install dbus-x11
