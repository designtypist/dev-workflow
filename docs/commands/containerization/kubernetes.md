# Kubernetes

### Basic Commands (get, describe, delete, explain...)
```
alias k=kubectl

kubectl get pods|po
  kubectl get po -A
  kubectl get po -o wide -n kube-system
kubectl get node|no
kubectl get namespaces|ns
kubectl get deploy
kubectl get rs //ReplicaSets
kubectl get all
  kubectl get all -n kube-system
kubectl get events

kubectl describe pod [pod name]
kubectl describe node [node name]
kubectl describe ns [namespace]
  kubectl describe ns kube-system

kubectl api-resources
kubectl explain pod
kubectl explain pod.spec –recursive

kubectl cluster-info
kubectl cluster-info dump > cluster-dump

kubectl logs [pod name]
  kubectl logs mypod

kubectl exec -it [pod name] bash
  kubectl exec -it mypod bash

kubeadm reset
```

### Kubernetes deployment
```
### Run a pod with image
kubectl run first --image=designtypist/first:1.0 --port=8080
kubectl get po -o wide
kubectl get all
kubectl delete po first  //delete pod

### Create deployment with image
kubectl create deploy mydeploy --image=designtypist/first:1.0 --port=8080
kubectl get deploy
kubectl get rs
kubectl get po -o wide
kubectl get all
kubectl delete deploy mydeploy  //delete deployment pod

### Yaml file deployment
kubectl create deploy mydeploy --image=designtypist/first:1.0 --port=8080 --dry-run=client -o yaml > deploy.yaml
vi deploy.yaml 
kubectl apply -f deploy.yaml 
kubectl get all
```

### Horizontal scaling
```
### Manual Scaling
kubectl get all
kubectl scale deploy mydeploy --replicas=10   (option1 to scale using imperative command)
kubectl get all
kubectl scale deploy mydeploy --replicas=2
kubectl get all

vi deploy.yaml     (option2 modify yaml and then apply)
kubectl apply -f deploy.yaml 
kubectl get all -o wide

kubectl edit deploy mydeploy  (option3 modify live object)
kubectl get all

### Automatic Scaling
kubectl get all
kubectl autoscale deploy mydeploy --cpu-percent=80 --min=2 --max=10 
kubectl get hpa
```

### Zero down time upgrade
```
kubectl create deploy mydeploy --image=nginx:latest --port=80
kubectl scale deploy mydeploy --replicas=20
kubectl describe po mydeploy-5b477bf648-z75xc
kubectl rollout history deploy mydeploy
kubectl rollout status deploy mydeploy
kubectl get all
kubectl set image deploy mydeploy nginx=nginx:1.8.1 --record
kubectl rollout history deploy mydeploy
kubectl rollout status deploy mydeploy
kubectl get all
kubectl describe po mydeploy-6b7b846487-xnb9x
kubectl set image deploy mydeploy nginx=nginx:1.9.1 --record
kubectl rollout history deploy mydeploy
kubectl rollout status deploy mydeploy
kubectl get all
kubectl describe po mydeploy-5f69579954-zpbs6
kubectl rollout history deploy mydeploy
kubectl get all
kubectl rollout undo deploy mydeploy --to-revision=2
kubectl rollout history deploy mydeploy
```

### Service
```
# Creating service using yaml files
git clone https://github.com/designtypist/serviceDemo.git
cd serviceDemo/
cd build/
vi app.py 
cd ..
cd deploy/

kubectl get all
vi db-pod.yml
kubectl apply -f db-pod.yml
kubectl get po
vi db-svc.yml
kubectl apply -f db-svc.yml
kubectl get all
vi web-pod.yaml
kubectl apply -f web-pod.yaml
kubectl get all
vi web-svc.yml
kubectl apply -f web-svc.yml
kubectl get all
kubectl get no -o wide

curl 172.31.41.217:31605/init
curl -i -H "Content-Type: application/json" -X POST -d '{"uid": "1", "user":"John Doe"}' http://172.31.41.217:31605/users/add
curl -i -H "Content-Type: application/json" -X POST -d '{"uid": "2", "user":"Bob"}' http://172.31.41.217:31605/users/add
curl 172.31.41.217:31605/users/1
curl 172.31.41.217:31605/users/2

# Creating service using imperative command
kubectl run nginx --image=nginx --port=80
kubectl get po
kubectl expose po nginx --name mysvc --type=NodePort --port=80 --target-port=80
kubectl get no -o wide
kubectl get all
curl 172.31.41.217:31558
```

### Daemonset
```
kubectl get po -n kube-system -o wide
kubectl get ds -n kube-system
kubectl get ds
vi ds.yaml //copy contents from this file
  - https://github.com/designtypist/dev-workflow/blob/aa0196a70d326c4f22d63b850818e8f35981e6c1/docs/resources/containerization/daemonset-example.yaml
kubectl apply -f ds.yaml
kubectl get ds
kubectl get po -o wide
```
