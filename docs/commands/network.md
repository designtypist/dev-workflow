# Network Commands

**Commonly used:**
```
ifconfig
ip a
ip r 
```

### Setup network netplan configurations

Create configuration for netplan
```
cd /etc/netplan/
sudo touch config.yaml
sudo vi config.yaml
```

Config.yaml Configuration Setup for Static IP
```
network:
  version: 2
  renderer: networkd
  [network interface type]
    ethernets:
      or
    wifis: 
    
    [network interface name]
      eth0: 
        or 
      wlp7s0:
      
     [network interface settings]
        dhcp4: no
        nameservers:
          addresses: [192.168.1.254, 8.8.8.8]
        addresses: [192.168.1.100/24]
        access-points:
          "[wifi name]":
            password: "[wifi password]"
        routes:
          - to: default
            via: 192.168.1.1     
```

Apply netplan configuration
```
sudo netplan try //test 
sudo netplan apply //apply configs
```
