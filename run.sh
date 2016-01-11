#!/bin/bash

sudo docker build -t kiwenlau/nfs-docker .

sudo docker rm -f nfs-server nfs-client > /dev/null

sudo docker run --privileged -d --name nfs-server kiwenlau/nfs-docker service nfs-kernel-server start

sudo docker run -d --name nfs-client --link nfs-server:nfs-server kiwenlau/nfs-docker mount nfs-server:/opt /opt 