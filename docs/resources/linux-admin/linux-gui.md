# Linux GUI
> Linux GUI Administration Setup with CockPit

## Cockpit Installation

### Virtual Machines
### Docker

### File Sharing Addons
Installation
```
sudo apt-get install cockpit python3 samba nfs-kernel-server
git clone https://github.com/45Drives/cockpit-file-sharing.git
cd cockpit-file-sharing
make install
```

### VMs and Docker Containers
Installation
```
sudo apt install cockpit-machines -y
sudo apt install cockpit-podman -y
```

### Samba Setup
```
vim /etc/samba/smb.conf
```
add “include = registry” under [global] section
```
sudo systemctl enable --now rpcbind nfs-server //refresh cockpit
```

