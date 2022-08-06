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


Run a docker container (wip)
```
$ docker run -d -P -p 8888:80 [container] --name static-size [container]
```
- -d detach our terminal
- -p Specify a custom port
- -P will publish all exposed ports to random ports
- --name corresponds to a name we want to give the container

Pull docker image
```
$ docker pull [container ie. hello-world]
```

List docker running containers
```
$ docker ps [-a]
```

Delete docker container
```
$ docker rm [id]
```

Docker containers port that are running
```
$ docker port [container]
```

Enter into a docker container
```
$ docker exec -it [container_id] /bin/bash
```

Copy contents to a docker container
```
docker cp [files] [conatiner_id]:[files]
```

List downloaded docker images
```
$ docker images
```
