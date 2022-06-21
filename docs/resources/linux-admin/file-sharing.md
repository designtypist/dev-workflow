# File Sharing

### Samba
Samba - file sharing for Windows OS
```
sudo apt-get install samba smbfs
sudo vim /etc/samba/smb.conf //edit samba config
sudo service smbd restart //restart samba service
```
WSDD - service for Windows OS to recognize samba file sharing
```
sudo apt-get install wsdd
sudo systemctl daemon-reload //reload daemon
sudo systemctl start wsdd
sudo systemctl enable wsdd //enable at boot
sudo service wsdd status
```

Setup samba configuration file
```
sudo vim /etc/samba/smb.conf
```
- At the end of file add Share Definitions
```
[SHARE NAME]
    path = [share dir]
    guest ok = [yes/no]
    read only = [yes/no]
    browseable = [yes/no]
    valid users = [user1 user2 @group]
```
* Note: If using Cockpit then [follow the steps](https://github.com/45Drives/cockpit-file-sharing#import-shares-from-smbconf) or else conflicts will happen
```
sudo service smbd restart
sudo service smbd status
```

### NFS
NFS Server Setup
```
sudo apt-get install nfs-kernel-server

sudo vim /etc/fstab //
sudo vim /etc/exports //

sudo systemctl start nfs-kernel-server.service
sudo exportfs -ar | -v
```

NFS Client Setup
```
sudo apt-get install nfs-common
...
```

### Resources
- [NFS Setup for Ubuntu](https://linuxize.com/post/how-to-install-and-configure-an-nfs-server-on-ubuntu-20-04/#installing-the-nfs-server)
