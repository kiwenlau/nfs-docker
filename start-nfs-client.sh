#!/bin/bash

mount $NFS_SERVER_IP:/opt /opt

# just keep this script running
while [[ true ]]; do
	sleep 1
done

