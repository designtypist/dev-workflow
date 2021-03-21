# Linux advanced

```
uname -r
lsb_release -a
grep -rnw [directory] -e [pattern]
find [directory] - name [file]
sudo service [service] restart
tail -f
```

Changing file's permissions and ownership
```
chmod 755 -R [directory]
chgrp -R www-data [directory]
chown -R www-data:www-data [directory]
```

Check if user has sudo privileges
```
sudo -l -U [user_name]
```

Add user to sudo group
```
sudo usermod -a -G sudo [user_name]
```
