# Linux basics

Useful find commands
```
grep -rnw [dir] -e '[string]'
find [dir] -name [file]
```

Find Linux OS Distribution Version
```
lsb_release -a
```

System Control
```
sudo systemctl enable [service name]
sudo systemctl status [service name]
sudo systemctl stop [service name]
sudo systemctl start [service name]
```

[Symbolic Links](https://www.lifewire.com/create-symbolic-links-ln-command-4059723)
```
ln -s /path/to/file /path/to/link
```

Clean up linux system
```
sudo apt-get autoremove
sudo apt clean
```

Linux groups
```
- add user to group
sudo usermod -a -G [group] [user]
- check user(s) groups
groups [user] 
less /etc/groups
```

Change shell
```
chsh
```
