#!/bin/bash

for source in $* 
do
	mkdir -p $source
    echo "$source *(rw,sync,no_subtree_check,fsid=1,no_root_squash)" >> /etc/exports
done

exportfs -a

rpcbind

service nfs-kernel-server start 

# just keep this script running
while [[ true ]]; do
	sleep 1
done

