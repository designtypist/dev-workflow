# Docker Swarm Commands

Change the hostname on all the nodes
```
hostnamectl set-hostname [hostname]
  hostnamectl set-hostname master
  hostnamectl set-hostname worker1
bash
```

Initialize master Docker node
```
# On master node:
docker swarm init

# On worker nodes
docker swarm join --token ...
```

List Docker nodes
```
docker node ls
```
