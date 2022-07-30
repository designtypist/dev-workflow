# System Administrator Commands

## Check System Statistics
Check process status
```
ps -ef | grep 'string'
ps aux | grep 'string'

systemctl list-units
systemctl list-unit-files
systemctl cat [service name]
```

Change system settings
```
sudo vim /etc/systemd/system/[service name]
systemd-delta //find system config changes
systemctl daemon-reload //reload unit configuration files
systemctl restart [service name]
```

Using system services
```
systemctl start | stop | status | enable | disable | reload | restart [service name]
systemctl is-active | is-enabled | is-failed [service name]

systemctl is-system-running //check system's operational status
systemctl --failed //check failed system services

systemctl get-default | set-default | isolate
```

Check disks
```
df -h
df -ih
```

Check memory
```
free
free -m //check memory in mb
```

Check process
```
top
htop
```

## Check system info
Print OS name
```
uname -a //all
uname -r //kernel
uname -v | -s | -m | -n
```

Print distribution specific info 
```
lsb_release -a
```

List all PCI devices
```
lspci
```

List USB devices
```
lsusb
```

List block devices
```
lsblk
```

## Change Permissions
Changing files or directories permissions
```
chmod g+rw- //group permissions
chmod o+r-- //other permissions
chmod a+rwx //all type permissions
chmod 755 -R [directory]
```

Changing files or directories ownership
```
chgrp -R www-data [directory]
chown -R www-data:www-data [directory]
```

Check if user has sudo privileges
```
sudo -l -U [username]
```

## Users and Groups
Add & delete users 
```
useradd
userdel [username] | sudo userdel -r [username]
```

User groups
```
groupadd [group name] //add user group
groupdel [group name] //delete user group

useradd -G [username] [group] //add user to group
usermod -a -G [group] [user]
usermod -G [username] [group]
```

Return user identity
```
id -a [username]
```

## Disk Partitions
Manipulate disk partitions
```
sudo fdisk -l
```

Editing mounting points
```
sudo vim /etc/fstab
```

## Control system services
Method 1
```
sudo systemctl list-unit-files --type service -all //list all services
sudo systemctl | grep [service names] //filter services
sudo systemctl start | stop | restart | status | enable [service name]
```

Method 2
```
sudo service --status-all //list all services
sudo service [service name] start | stop | restart | status | enable
```

## Managing apt and repos

Apt Update and Upgrade
```
sudo apt update && sudo apt upgrade
sudo apt list --upgradable
sudo apt full-upgrade
```

Apt Install, Remove, and Clean
```
sudo apt install [app name]
sudo apt remove [app name]
sudo apt purge [app name]

sudo apt-get autoremove
sudo apt clean
```

Apt Search, Show, List
```
sudo apt search [app name]
sudo apt show [app name]
sudo apt list
sudo apt list --installed
```

List repo
```
sudo apt edit-sources
sudo vim /etc/apt/source.list
```

## Manual Pages
Check exit code status
```
echo $? //return exit value

echo $?
man t
echo $?
```

Search man pages
```
man -k [search filter]
```

## Terminal
Check terminal settings
```
tty //terminal name
stty -a //check terminal settings
```

## Other
Prints out the shared objs
```
ldd /bin/cat
```

Check command locations and type
```
type -all [cmd]
echo $PATH
```
