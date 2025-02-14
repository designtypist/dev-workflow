# File Management

### Managing File Ownership and Permissions
Changing files or directories permissions
```
chmod [u|g|o] [file or directory]
    chmod 755 -R directory

chmod u+rwx //user permissions
chmod g+rw //group permissions
chmod o+r //other permissions
chmod a+rx //all type permissions

chmod u+s //set user id bit
chmod g+s //set group id bit
chmod ug //set both user and group id bits
```

Changing files or directories ownership
```
chown [new owner] [file or directory]
    chown admin file
chown [new owner]:[new group] [file or directory]
    chown -R admin:admins directory
chgrp [new group] [file or directory]
    chgrp -R admins directory
```
