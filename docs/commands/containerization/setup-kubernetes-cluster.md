# Creating a Kubernetes Cluster
---

## Setup Docker Config/Runtime - Startup (optional)
```
### Create deamon for Docker

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

## Set Hostname and Execute (on all nodes)
```
sudo hostnamectl set-hostname [hostname]
  sudo hostnamectl set-hostname master.example.com
  sudo hostnamectl set-hostname worker1.example.com
  sudo hostnamectl set-hostname worker2.example.com
exec bash
```

## Setup Master Node for Cluster
```
### Initialize Master Node
sudo kubeadm init (follow steps provided)
  sudo kubeadm init --ignore-preflight-errors=all

### Allow Non-root Users to Access kubeadm
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

### Setup Container with Container Networking Interface
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

## Setup for Joining Worker Nodes
```
sudo kubeadm join ... [ip][tokens]
  kubeadm join 172.31.31.218:6443 --token geakqk.caq9ntsen80v7enb --discovery-token-ca-cert-hash sha256:2111894bd6766ed93c4c7df3e2628145bce0fd80fdd32180e706eb904e0016dc
sudo kubeadm token create --print-join-command //reprint out k3 worker node
kubectl get nodes //check if joining the cluster has been successful
```

## Remove all traces of kubernetes on machine (use with CAUTION)
```
kubeadm reset -f
sudo rm -rf /etc/kubernetes

sudo rm -rf /var/lib/etcd
```
