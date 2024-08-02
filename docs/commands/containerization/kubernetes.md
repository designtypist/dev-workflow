# Kubernetes

## Basic Commands (get, describe, delete, explain...)
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

Kubernetes Deployment
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


Horizontal Scaling
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
