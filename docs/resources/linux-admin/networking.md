# Networking

### Network
```
sudo service networking restart

sudo vim /etc/netplan/config.yaml
```

### Monitoring
```
sudo apt-get install nmap
sudo namp -sn 192.168.1.0/24
```

### Hostname
```
sudo vim /etc/hosts
```
Hostnamectl
```
hostnamectl //check the hostname config
sudo hostnamectl set-hostname vim //set config file
sudo systemctl restart avahi-daemon //restart mDNS service
```

### DNS
```
sudo vim /etc/resolv.conf
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
  - https://kodi.wiki/view/HOW-TO:Set_up_Wake-on-LAN_for_Ubuntu
  - https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html
  - https://wiki.debian.org/WakeOnLan
  - https://a3nm.net/blog/wakeonlan.html
- Windows:
  - https://www.nirsoft.net/utils/wake_on_lan.html#DownloadLinks
  - https://www.groovypost.com/howto/enable-wake-on-lan-windows-10/
