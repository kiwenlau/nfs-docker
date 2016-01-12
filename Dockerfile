FROM ubuntu:14.04

MAINTAINER kiwenlau <kiwenlau@gmail.com>

WORKDIR /root

RUN apt-get update && apt-get install -y nfs-kernel-server nfs-common

RUN echo "/opt *(rw,sync,fsid=1,no_root_squash,no_subtree_check)" >> /etc/exports

RUN sudo exportfs -a

EXPOSE 111/udp 2049/tcp

