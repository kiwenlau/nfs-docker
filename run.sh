#!/bin/bash

# sudo docker build -t kiwenlau/nfs-docker .

sudo docker rm -f nfs-server nfs-client > /dev/null

sudo docker run --privileged -d -it --name nfs-server kiwenlau/nfs-docker bash -c "rpcbind; service nfs-kernel-server start; bash"

sudo docker run --privileged -d --name nfs-client --link nfs-server:nfs-server -it kiwenlau/nfs-docker bash -c "mount nfs-server:/opt /opt; bash"