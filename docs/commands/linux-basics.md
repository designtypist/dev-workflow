# Linux basics

Useful find commands
```
grep -rnw [directory] -e [pattern]
find [dir] -name [file]
mv .[!.]* [dir] (hidden files)
tail -f [log file]
```

Grep & Egrep
```
egrep | grep -o -> output matched parts of a matching line
             -v -> invert the match
             -c -> display the count of matching lines
             -l -> display the list of filenames 
             -n -> display the matched lines and their line numbers
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
