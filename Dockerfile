FROM ubuntu:14.04

MAINTAINER kiwenlau <kiwenlau@gmail.com>

WORKDIR /root

RUN apt-get update && apt-get install -y nfs-kernel-server nfs-common

ADD start-nfs-server.sh /usr/local/bin

ADD start-nfs-client.sh /usr/local/bin

EXPOSE 111/udp 2049/tcp

