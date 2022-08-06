# Local Server Setup

### Mounting Drives
- [Mounting 2nd Drive](https://www.howtogeek.com/442101/how-to-move-your-linux-home-directory-to-another-hard-drive/)

### Change Hostname
[Change Hostname](https://www.cyberciti.biz/faq/how-to-change-hostname-on-ubuntu-20-04/)
```
sudo hostnamectl set-hostname [new-computer-name-here]
sudo vim /etc/hostname
sudo vim /etc/hosts
sudo reboot
```

### Cockpit
- https://cockpit-project.org/running
- https://www.hostwinds.com/guide/installing-and-using-cockpit-docker-linux-vps/
- https://www.techrepublic.com/article/how-to-add-container-management-to-cockpit/
- https://askubuntu.com/questions/1230689/is-missing-cockpit-docker-no-longer-in-the-20-04-repository

### OpenSSH Server
[Open SSH Server Setup](https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/)
```
sudo apt-get install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

sudo ufw allow ssh
sudo ufw enable
sudo ufw status

sudo systemctl status ssh
```

### Wake On LAN

**WOL Setup**
```
sudo apt-get install ethtool
sudo ethtool eth0
sudo ethtool -s eth0 wol g
```
- 'add line `up ethtool -s eth0 wol g`' on network interface when it is starting up
- https://wiki.debian.org/WakeOnLan
- https://a3nm.net/blog/wakeonlan.html

**WOL Wakeup**
- Linux
    ```
    sudo apt-get install powerwake
    powerwake [ip address]
    ```
    - https://kodi.wiki/view/HOW-TO:Set_up_Wake-on-LAN_for_Ubuntu
    - https://www.cyberciti.biz/tips/linux-send-wake-on-lan-wol-magic-packets.html

- Windows
  - https://www.nirsoft.net/utils/wake_on_lan.html#DownloadLinks
  - https://www.groovypost.com/howto/enable-wake-on-lan-windows-10/

### Network Configurations (Netplan)
- https://netplan.io/examples/
- https://linuxhint.com/ubuntu_20-04_network_configuration/

### Samba Server
`sudo apt-get install samba -y`
- https://devtutorial.io/how-to-install-and-configure-samba-on-ubuntu-server-20-04.html

### Securing Server

Add New User
```
adduser [username]
usermod -aG sudo [username]
su - [username]
```

SSH and Disable Root Access
```
mkdir ~/.ssh && chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
vim ~/.ssh/authorized_keys (and add your ssh key)
sudo vi /etc/ssh/sshd_config
  PermitRootLogin no
  PasswordAuthentication no (make sure a public key is setup for login access)
sudo systemctl restart ssh
```

UFW Firewall
```
sudo ufw app list
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
sudo ufw allow [port]/tcp
sudo vim /etc/ssh/sshd_config
  Port [port]
sudo systemctl restart ssh
```

Fail2Ban
```
sudo apt install fail2ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
sudo fail2ban-client status
```

### Cronjobs
### OpenVPN
