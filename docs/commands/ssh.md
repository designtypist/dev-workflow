# SSH commands

### Local

Create SSH keys
```
ssh-keygen -t rsa -C "[comment]"
ssh-keygen -p -o -f [source of SSH key]
```

Copy SSH Public Keys
```
ssh-copy-id [user@ip-address]
ssh-copy-id [pi@192.168.0.1]
```

Import SSH Public Keys
```
ssh-import-id gh:designtypist
```

Use Non-Default Private Key
```
ssh -i /path/to/private-key
```

SSH Passwordless Access
```
ssh-agent $SHELL
ssh-add
```