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

List Docker nodes or services
```
docker node ls
docker service ls
docker service ps [service name]
docker stack ls
docker stack ps [docker stack name]
```

Docker remove service
```
docker service rm [service name]
```

Deploying application as replicated service 
```
# On master node
docker service ls
docker service create --name [service name] --replicas 5 [image name]
  docker service create --name myservice --replicas 5 designtypist/first:1.0
docker service ps myservice
docker ps
```

Deploying application as a global mode
```
# On master node
docker service ls
docker service create --name [service name] --mode global [docker image]
  docker service create --name myservice --mode global designtypist/first:1.0
docker service ps myservice
docker ps
```

Scaling the service
```
docker service ls
docker service create --name myservice --replicas 5 designtypist/first:1.0
docker service ps myservice
docker service scale myservice=10
docker service ps myservice
```

Accessing application running in Docker swarm
```
docker service create --name myservice --publish target=8080,published=8000 designtypist/first:1.0
docker service ps myservice
docker service ls
curl localhost:8000
```

Creating custom overlay network
```
docker network create -d overlay myoverlay
docker network ls
docker service create --name myservice --publish target=8080,published=8000 --network myoverlay designtypist/first:1.0
```

Draining the node
```
docker node update --availability drain [node]
  docker node update --availability drain master
```

Docker stack commands
```
docker stack deploy --compose-file [docker-compose yaml] [docker stack name]
  docker stack deploy --compose-file compose.yaml stackdemo
  docker stack ps stackdemo
```
