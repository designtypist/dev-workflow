# Account Tools

### Users and Groups
Add & delete users
```
useradd <options> [username]
  sudo useradd admin //short-form method
  sudo useradd -s /bin/bash -d /home/admin -m -G admin admin //long-form method
  sudo passwd admin //create password for new user
userdel [username]
  sudo userdel -r admin //delete user and user's home directory
```

User groups
```
groupadd [group name] //add user group
groupdel [group name] //delete user group
useradd -G [username] [group] //add user to group
```

User & group modifications
```
usermod -aG [group] [user] //add user to group
  usermod -aG sudo admin
usermod -l [new username] [old username] //change user name 
usermod -d [/home/new username] -m [new username] //change home directory name
groupmod -n [group] [new group] //change group name
```

Show or change user password information
```
passwd [user] //change passwd of user
passwd -S [user] //show status of the password
chage -l [user] //show status of user password expiry info
chage -M 90 [user] //set 90 days as the maximum before password expiry
```

Return user information
```
id -a [username] //display user identify
whoami //display currently logged in user
w //similar to who but contains more robust output
who //display who is currently logged into the machine
```