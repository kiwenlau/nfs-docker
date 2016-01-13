##简介

将NFS运行在Docker容器中，可以在容器之间共享目录。并且可以跨主机实现目录共享。


##在单机上使用方法

**内核载入nfs模块**

```
modprobe nfsmodprobe nfsd
```

**运行nfs sever容器**

```
sudo docker run --privileged -d -it --name nfs-server kiwenlau/nfs-docker start-nfs-server.sh /opt
```

**获取nfs server容器**

```
NFS_SERVER_IP=$(docker inspect --format="{{.NetworkSettings.IPAddress}}" nfs-server)
```

**运行nfs client**

```
sudo docker run --privileged -d --name nfs-client --link nfs-server:nfs-server -e "NFS_SERVER_IP=$NFS_SERVER_IP" -it kiwenlau/nfs-docker start-nfs-client.sh /opt:/opt
```

##在多个主机上使用方法

运行nfs server和nfs client容器时，采用--net=host模式，使得两个容器可以跨主机通信。然后将运行nfs server容器的主机IP通过NFS_SERVER_IP传递给nfs client容器即可。

##参考
[cpuguy83/docker-nfs-server](https://github.com/cpuguy83/docker-nfs-server)

[cpuguy83/docker-nfs-client](https://github.com/cpuguy83/docker-nfs-client)