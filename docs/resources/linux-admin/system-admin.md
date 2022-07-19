# System Administrator Commands

## Check System Statistics
Check process status
```
ps -ef | grep 'string'
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
uname -v
uname -s
uname -m
uname -n
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

## Permissions
Change permissions
```
chmod g+rw- //group permissions
chmod o+r-- //other permissions
chmod a+rwx //all type permissions
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
usermod -G [username] [group] //add user to group
```

Return user identity
```
id -a [username]
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
