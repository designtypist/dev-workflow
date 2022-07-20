# Linux basics

Useful find commands
```
grep -rnw [directory] -e [pattern]
find [dir] -name [file]
mv .[!.]* [dir] (hidden files)
tail -f [log file]
```

[Symbolic Links](https://www.lifewire.com/create-symbolic-links-ln-command-4059723)
```
ln -s /path/to/file /path/to/link
```

Change shell
```
chsh
```

Fuser - identify processes using files or sockets
```
fuser 8080/tcp //print Process ID
fuser -k 8080/tcp //kill the Process ID on the specified port
```
