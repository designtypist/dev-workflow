# Docker

## Basic Docker Usage
```
docker ps
```

## Docker-compose Running Docker Configurations
```
docker-compose up -d --force-recreate //run docker config file 
docker-compose up --detach --build //make changes to docker config and wants to apply it
docker-compose run --rm panel php artisan p:user:make
```
