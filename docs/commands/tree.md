# Tree Commmands

Basic command usage
```
tree -a //hidden files
tree -f //full path prefix
tree -d //print subdir without files
tree -df //print full dir
tree -L 2 //# display the depth of dir tree
```

Advanced command usage
```
tree -f -P [pattern] //display matching pattern(s)
tree -f --prune //prune empty dir
tree -f -p //print file type and permissions
tree -f -u //print file user
tree -f -g //print file group
    tree -f -pug 
tree -f -h //print file size (human readable format)
tree -f -D //print file date
tree -f --du //print accumation of file sizes in subdir
tree -o [file name] //output results to file
```
