# Kubernetes
## Basic Commands (get, describe, delete, explain...)
```
kubectl get all
kubectl get all -n kube-system

kubectl get events
kubectl get node  worker01
kubectl get nodes
kubectl get ns
kubectl get namespaces
kubectl get pods -n kube-system
kubectl get pods
Kubectl get pods -A

kubectl describe pod [pod name]
kubectl describe node [node name]
kubectl describe ns kube-system

kubectl delete pod <pod-name>

kubectl api-resources
kubectl explain pod
kubectl explain pod.spec –recursive

kubectl run nginxpod --image=nginx --port 80

kubectl cluster-info
kubectl cluster-info dump > cluster-dump
```
