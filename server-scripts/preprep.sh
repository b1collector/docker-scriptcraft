#! /bin/bash

# update the server
# apt-get update
# apt-get upgrade

# set a swap file
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
# sh -c 'echo "/swapfile none swap sw 0 0" >> /etc/fstab'

sysctl vm.swappiness=10
# sh -c 'echo "vm.swappiness=10" >> /etc/sysctl.conf'

# configure firewall
ufw allow ssh
ufw allow 25565/tcp

# build the docker file
docker build -t b1collector/scriptcraft .

# run scriptcraft
#docker run -it --rm -p 25565:25565 -e OPS=520c7824-cb8c-4d53-bef1-37c15be92d96 b1collector/scriptcraft
