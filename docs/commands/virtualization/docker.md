# Docker Commands

<details><summary>MORE INFO</summary>
<p>

---
- Images - The blueprints of our app which form the basis of containers
- Containers - Contains and runs the Docker images
- Docker Daemon - Background services running on the host that manages building, running, and distributing Docker containers
- Docker Client - A way to interact with the Docker Daemon
- Docker Hub - A registry of Docker images
---
- Base Images - no parent images, Child Images - built on top of base images
- Official Images - official images maintained and supported by Docker
- User Images - Created and shared by users
---

</p>
</details>


Docker container commands
```
docker run -d -P -p 8000:80 [container] --name static-size [container]

-d detach our terminal
-p Specify a custom port
-P will publish all exposed ports to random ports
--name corresponds to a name we want to give the container

docker ps [-a]
docker stop [id] [id2]
docker start [id] [id2]
docker rm [id] [id2]
```

Docker image commands
```
docker images //list downloaded images
docker rmi [id] [id2] [id3] //delete image(s)
```

Enter into a docker container
```
docker exec -it [container_id] /bin/bash
```

Copy contents to a docker container
```
docker cp [files] [conatiner_id]:[files]
```

Docker checks
```
docker port [container]
docker logs [id]
docker stats
```

Docker Push/Pull image repository
```
# Public repository
docker login
docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
docker push IMAGE_NAME[:TAG] (ie. ubuntu:1.0)
docker pull IMAGE_NAME[:TAG] (ie. hello-world)

# Private repository
docker run -d --name myregistry -p 5000:5000 registry:2
docker tag designtypist/first:1.0 localhost:5000/first:1.0
docker push localhost:5000/first:1.0
docker pull localhost:5000/first:1.0
```

Docker volume commands
```
docker run -d --name [container name] -p 8001:8080 -v /opt:/etc/test [docker image]

docker volume -h
docker volume create myvolume
docker volume ls
docker run -d --name [container name] -p 8001:8080 -v myvolume:/etc/test [docker image]
ls /var/lib/docker/volumes/  //location of create volume 
```

Docker network commands
```
docker network ls
docker network inspect [network type]
  docker network inspect bridge
```
