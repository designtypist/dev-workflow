# Networking

### Basic Networking
Setup network configuration
```
sudo vim /etc/netplan/config.yaml
sudo service networking restart
```

Check network activity
* Common usage
```
ping [ip addr / domain]
ifconfig [ethernet interface]
ip a | r
nsloop [server]
dig [ip addr / domain]
tracepath [ip addr / domain ]
nc [destination] [port]
nmcli
netstat
```

* Advanced methods
```
cat /etc/services
grep -w 80 /etc/services
egrep -w '53/(tcp/udp)' /etc/services
```

App Processes
```
netstat -tulpn | grep ":8000"
kill -9 [process id]
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

### Hostname
```
sudo vim /etc/hosts //edit hosts configuration file
hostname //check hostname

hostnamectl //check the hostname config
hostnamectl set-hostname [hostname] //set config file
sudo systemctl restart avahi-daemon //restart mDNS service
```

### DNS
Check nameservers of domain
```
host [domain]
dig [domain]
nslookup -type=ns [domain](ie. designtypist.com)
```

Setup configuration of local DNS
1) Setup with resolve configuration
```
sudo vim /etc/resolv.conf
```

2) Setup with BIND
Installation
```
sudo apt-get install bind9 bind9utils bind9-doc
```

Setup
```
sudo ufw allow Bind9 //add firewall rule

sudo systemctl restart bind9
sudo vim /etc/bind/name.conf.options
```

3) Setup with DNSMasq
Installation and Usage
```
sudo apt-get install dnsmasq
sudo systemctl [status/restart/start/stop/enable/disable] dnsmasq
sudo systemctl [status/restart/start/stop/enable/disable] resolvconf
```

Setup DNS configurations
```
sudo cp /etc/dnsmasq.conf{,.bak}
sudo vim /etc/dnsmasq.conf

dnsmasq --test //check for syntax errors
```

Setup local hosts configurations
```
sudo vim /etc/hosts
sudo vim /etc/resolv.conf //add local dns server
```

### Wake On LAN

**WOL Setup**
```
sudo apt-get install etherwake ethtool wakeonelan
sudo ethtool -s [ethernet interface] [wireless interface] g
sudo ethtool -s enp1s0 wlp4s0 g
```
- 'add line `up ethtool -s eth0 wol g`' on network interface when it is starting up

**Network Check Status**
```
sudo ethtool [network interface] //check status of network interface
sudo ethtool enp1s0
```

**WOL Wake Up Device**
```
ping -c 4 server3 && arp -n //find mac address on network
etherwake [mac address]
  or
wakeonlan [mac address]
```

### Wireless Networks
```
iwlist //list nearby wireless networks
iwconfig [wireless interface]
```
