# Kubernetes
---

## Creating a Kubernetes Cluste

Set Hostname and Execute (on all nodes)
```
sudo hostnamectl set-hostname master.example.com
exec bash
```

## Setup Docker Config/Runtime - Startup

### Create deamon for Docker
```
cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
	"max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF
```
—------------------------------------------------------------
```
sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo swapoff -a
```

## Setup Initialize Master Node
```
sudo kubeadm init (follow steps provided)
```

### Setup Container with Container Networking Interface
```
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml
```

### Setup for Joining Worker Nodes
```
sudo kubeadm join ... [ip][tokens]
sudo kubeadm token create --print-join-command //reprint out k3 worker node
kubectl get nodes //check if joining the cluster has been successful
```

Basic Commands (get, describe, delete, explain...)
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

## Remove all traces of kubernetes on machine (use with CAUTION)
```
kubeadm reset -f
```
