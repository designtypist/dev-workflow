# Boot

## Remove old Linux kernels to save space
Check current Linux kernel
```
uname -r
```

List Linux kernels
```
sudo dpkg --list | egrep 'linux-image|linux-headers' //list all
sudo dpkg --list | egrep 'linux-image|linux-kernel' | grep '^ii' //list installed kernels
sudo dpkg --list | egrep 'linux-image|linux-headers' | grep '^ii' | wc -l
```

Check disk space
```
df -h
```

Method 1) Remove old Linux kernels and lingering software packages
```
sudo apt autoremove --purge
```

Method 2) Manually deleting old Linux kernels
```
sudo apt purge [Linux kernel version]
sudo apt purge linux-image-5.8.0-50-generic
```
