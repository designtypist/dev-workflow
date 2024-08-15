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

### Clean up
kubectl delete po mysql web1
kubectl delete svc mysql web
kubectl delete po nginx
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

### Clean up
kubectl delete ds fluentd-elasticsearch
```

### Scheduling (Node Selector, Node Affinity, Pod Affinity)
```
# Node Selector
kubectl get all
kubectl get no --show-labels
kubectl label no worker1 hdd=ssd
kubectl get no --show-labels
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/a18a92e911b58667785a93c71a2601c9b100a65f/docs/resources/containerization/node-selector.yaml
kubectl apply -f pod.yaml
kubectl get po -o wide
kubectl delete po first
kubectl get no --show-labels
kubectl label no worker1 hdd-  //delete label
kubectl get no --show-labels
kubectl apply -f pod.yaml 
kubectl get po
kubectl describe po  first

# Node Affinity
kubectl explain po
...
kubectl explain po.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.nodeSelectorTerms.matchExpressions
kubectl get no --show-labels
kubectl label no worker1 hdd=ssd
kubectl get no --show-labels
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/547d5890ebe206b140f586e63892b6e8ac2780af/docs/resources/containerization/node-affinity.yaml
kubectl apply -f pod.yaml 
kubectl get po -o wide

# Pod Affinity
kubectl explain po.spec.affinity.podAffinity
...
kubectl explain po.spec.affinity.podAffinity.requiredDuringSchedulingIgnoredDuringExecution.labelSelector.matchExpressions
kubectl get po
kubectl run nginx --image=nginx
kubectl get po --show-labels
kubectl label po nginx hdd=ssd
kubectl get po --show-labels
kubectl get po -o wide
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/75de5ae8bb2910b05a547fe7637d126a70b1b763/docs/resources/containerization/pod-affinity.yaml
kubectl apply -f pod.yaml
kubectl get po -o wide

# Pod AntiAffinity
kubectl get po -o wide
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/ce31469fe27ff5783d2a555f14920a1d914a0382/docs/resources/containerization/pod-anti-affinity
kubectl apply -f pod.yaml 
kubectl get po -o wide

# Taint and tolerations for pod
kubectl describe no master
kubectl describe no worker1
kubectl describe no worker2
kubectl taint no worker1 hdd=ssd:NoSchedule
kubectl describe no worker1

kubectl run nginx --image=nginx --port=80 --dry-run=client -o yaml > pod.yaml
vi pod.yaml
kubectl apply -f pod.yaml
kubectl get po -o wide
kubectl delete po nginx

kubectl get no
kubectl cordon worker2 //disabled scheduling
kubectl get no
kubectl apply -f pod.yaml
kubectl get po -o wide
kubectl describe po nginx
kubectl delete po nginx

vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/4a92fd80b01a9bd1895f8414cd9494a0d1513f37/docs/resources/containerization/taint-and-tolerations.yaml
kubectl apply -f pod.yaml 
kubectl get po -o wide

### Clean up
kubectl uncordon worker2
kubectl taint no worker1 hdd-

# Taint and tolerations for daemonset
vi ds.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/d7b56d7ec82b341ce9b1995211cb7f071ecec3cd/docs/resources/containerization/ds-taints-and-tolerations.yaml
kubectl apply -f ds.yaml 
kubectl get ds
kubectl get po -o wide

### Clean up
kubectl delete ds fluentd-elasticsearch
kubectl delete po nginx
```

### Jobs
```
# Job
kubectl get job
kubectl create job myjob --image=ubuntu:20.04 --dry-run=client -o yaml -- /bin/sh -c "sleep 10" > job.yaml
vi job.yaml 
kubectl apply -f job.yaml
watch kubectl get all
kubectl delete job myjob

vi job.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/96bb6036949e9929b55baa1e658e6e13a3f056c5/docs/resources/containerization/job.yaml
k apply -f job.yaml
kubectl delete job myjob

# Cronjob
kubectl get cj
kubectl create cj mycj --image=ubuntu:20.04 --schedule="*/1 * * * *" --dry-run=client -o yaml -- /bin/sh -c "sleep 10" > cronjob.yaml
vi cronjob.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/01cc6b9206253ce63a27e5210b36cccc34bfd202/docs/resources/containerization/cronjob.yaml
kubectl apply -f cronjob.yaml 
watch kubectl get all
```

### Config map
```
# Create configmaps from literal values
kubectl get no
kubectl get cm
kubectl create cm mycm --from-literal=db_port=8080 --from-literal=db_host=192.168.1.5
kubectl get cm
kubectl describe cm mycm
kubectl run nginx --image=nginx --port=80 --dry-run=client -o yaml > pod.yaml
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/d647ae69d79305e759c2de5ffe8c47e0c74d043b/docs/resources/containerization/configmap-literal-values.yaml
kubectl apply -f pod.yaml
kubectl get po
kubectl exec -it nginx bash
kubectl exec -it nginx -- env

# Create configmaps from file
vi myconfig.ini

logfile=myapp.log
dbport=8080
dbhost=localhost
dbuser=admin

kubectl create cm mycm1 --from-file=myconfig.ini
kubectl describe cm mycm1
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/dcb9f4753b5d32eda0339c63bce5cf521e0e37d0/docs/resources/containerization/configmap-from-file.yaml
kubectl apply -f pod.yaml
kubectl get po
kubectl exec -it nginx bash
  cat /etc/lala/myconfig.ini //run inside the pod
```

### Secrets
```
# Generic secret
kubectl create secret generic db-secret --from-literal=dbpass=admin
kubectl get secret
kubectl describe secret db-secret
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/5d57f7493aea2ebc74d0f9f1610e62f8bd916a23/docs/resources/containerization/generic-secret.yaml
kubectl apply -f pod.yaml
kubectl get po
kubectl exec -it nginx -- env

# Docker registry secret
kubectl create secret docker-registry docker-secret --docker-email=example@gmail.com --docker-username=dev --docker-password=pass1234 --docker-server=my-registry.example:5000
kubectl get secret
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/b7abe7f66651932ad5d6ba934cd79b9e438942b2/docs/resources/containerization/docker-registry-secret.yaml
kubectl apply -f pod.yaml
kubectl get po
kubectl exec -it nginx -- env

# TLS secrets
kubectl create secret tls my-tls-secret --cert=/etc/kubernetes/pki/ca.crt --key=/etc/kubernetes/pki/ca.key 
kubectl get secret
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/4fa93d49f1a67ac76e331fba902daa93aa972d37/docs/resources/containerization/tls-secret.yaml
kubectl apply -f pod.yaml
kubectl get po
kubectl exec -it nginx bash
  ls /etc/cert-data
```

### PersistentVolume & PersistentVolumeClaim
```
kubectl explain pv.spec
kubectl explain pv.spec.nfs
kubectl explain pv.spec.vsphereVolume
kubectl explain pv.spec.awsElasticBlockStore

vi pv.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/8769d0129c393c1dc6ca07d318d277d2b4b23bcc/docs/resources/containerization/persistent-volume.yaml
kubectl apply -f pv.yaml
kubectl get pv

vi pvc.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/7b575aff45da5afb82cbc750c9921bb0f5face59/docs/resources/containerization/persistent-volume-claim.yaml
kubectl apply -f pvc.yaml
kubectl get pvc

vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/03c0da63bc1f57bbd1ce7516b060cfbc54592233/docs/resources/containerization/persistant-volume-pod.yaml
kubectl apply -f pod.yaml
kubectl get po
k exec -it nginx -- ls /etc/lala
```

### Statefulset
```
git clone https://github.com/rskTech/k8s_material.git
cd k8s_material/statefulset/
vi sc.yaml
kubectl apply -f sc.yaml
kubectl get sc

vi sfs.yaml
kubectl apply -f sfs.yaml
kubectl get sts
kubectl get po
kubectl get pvc

vi pv.yaml
kubectl apply -f pv.yaml
kubectl get po
kubectl get pv
kubectl get pvc

vi pv1.yaml
kubectl apply -f pv1.yaml
kubectl get po
kubectl get pv
kubectl get pvc

vi pv2.yaml 
kubectl apply -f pv2.yaml 
kubectl get pvc
kubectl get sts
kubectl get po

kubectl delete po web-0
kubectl get po
kubectl scale sts web --replicas=5
kubectl get po
kubectl scale sts web --replicas=3
kubectl get po
kubectl get pv
kubectl get pvc
```

Assigning resources
```
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/df6286a7a1e1d5a3755c09393edb5b9c65a521dd/docs/resources/containerization/assigning-resources.yaml
kubectl apply -f pod.yaml
kubectl get po
kubectl describe po nginx
kubectl get no
kubectl describe no worker1
```

Resource quota
```
kubectl create ns myns
kubectl get ns
vi rq.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/ef6e565b5d6b8a99a04ee1bd3b4531591f22b453/docs/resources/containerization/resource-quota.yaml
kubectl apply -f rq.yaml
kubectl get quota -n myns
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/d280e4463510d6c43ac35684fd96a8956e13876a/docs/resources/containerization/resource-quota-pod.yaml
kubectl apply -f pod.yaml 
kubectl get po -n myns
kubectl get quota -n myns
```

Priority class
```
kubectl api-resources | grep class
vi pc.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/9932725c676007e4b9be23e8f851c2c1c16c6669/docs/resources/containerization/priority-class.yaml
kubectl apply -f pc.yaml
vi pod.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/9932725c676007e4b9be23e8f851c2c1c16c6669/docs/resources/containerization/priority-class-pod.yaml
kubectl apply -f pod.yaml 
kubectl get po
```

Network policy
```
kubectl run db --image=nginx
kubectl run frontend --image=nginx
kubectl run other --image=nginx
kubectl get po -o wide
kubectl exec -it frontend bash
  apt-get update && apt-get install iputils-ping -y
  ping [db pod ip address]
kubectl exec -it other bash
  apt-get update && apt-get install iputils-ping -y
  ping [db pod ip address] //should succeed

kubectl get po --show-labels
kubectl label po db role=db
kubectl label po frontend role=frontend
kubectl get po --show-labels
vi np.yaml //copy contents from this file
- https://github.com/designtypist/dev-workflow/blob/355b2c88b63ec05b67a8f82fe92823cabb31cf0d/docs/resources/containerization/network-policy.yaml
kubectl apply -f np.yaml
kubectl get networkpolicy
kubectl get po -o wide
kubectl exec -it frontend bash
  apt-get update && apt-get install iputils-ping -y
  ping [db pod ip address]
kubectl exec -it other bash
  apt-get update && apt-get install iputils-ping -y
  ping [db pod ip address] //should fail
```
