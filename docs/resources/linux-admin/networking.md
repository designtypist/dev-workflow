# Networking

### Network
Setup network configuration
```
sudo vim /etc/netplan/config.yaml
sudo service networking restart
```

Check network activity
* Common usage
```
ping [ip addr / domain]
nsloop [server]
dig [ip addr / domain]
tracepath [ip addr / domain ]
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

###Resources:
- Linux:
  Wake-on-LAN  
  - https://kodi.wiki/view/HOW-TO:Set_up_Wake-on-LAN_for_Ubuntu
  - https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html
  - https://wiki.debian.org/WakeOnLan
  - https://a3nm.net/blog/wakeonlan.html
  BIND
  - https://www.server-world.info/en/note?os=Ubuntu_22.04&p=dns&f=1
  DNSMasq
  - https://kifarunix.com/configure-local-dns-server-using-dnsmasq-on-ubuntu-20-04/ 
  - https://stevessmarthomeguide.com/home-network-dns-dnsmasq/
  - https://www.howtogeek.com/devops/how-to-run-a-local-network-dhcp-server-with-dnsmasq/
- Windows:
  - https://www.nirsoft.net/utils/wake_on_lan.html#DownloadLinks
  - https://www.groovypost.com/howto/enable-wake-on-lan-windows-10/
