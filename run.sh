#!/bin/bash

sudo docker build -t kiwenlau/nfs-docker .

sudo docker rm -f nfs-server nfs-client > /dev/null

sudo docker run --privileged -d -it --name nfs-server kiwenlau/nfs-docker start-nfs-server.sh

NFS_SERVER_IP=$(docker inspect --format="{{.NetworkSettings.IPAddress}}" nfs-server)

sudo docker run --privileged -d --name nfs-client --link nfs-server:nfs-server -e "NFS_SERVER_IP=$NFS_SERVER_IP" -it kiwenlau/nfs-docker start-nfs-client.sh