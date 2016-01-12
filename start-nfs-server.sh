#!/bin/bash

echo "/opt *(rw,sync,fsid=1,no_root_squash,no_subtree_check)" >> /etc/exports

exportfs -a

rpcbind

service nfs-kernel-server start 

# just keep this script running
while [[ true ]]; do
	sleep 1
done

