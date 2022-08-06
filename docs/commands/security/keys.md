# Security Keys
1. Secure Shell (SSH)
2. Let's Encrypt
3. GPG Keys

## Secure Shell (SSH)
Create SSH keys
```
ssh-keygen -t rsa -C "[comment]"
ssh-keygen -p -o -f [source of SSH key]
```

Copy SSH Public Keys
```
ssh-copy-id [user@ip-address]
ssh-copy-id [pi@192.168.0.100]

ssh-copy-id -i [ssh_public_key path] [user@ip-address]
ssh-copy-id -i ~/.ssh/other_key.pub jchung@192.168.0.100
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

Setup remote SSH with no password
```
sudo vim /etc/sudoers
```
- insert into file [user] ALL=(ALL) NOPASSWD: ALL

## Let's Encrypt
```
sudo apt install letsencrypt
sudo systemctl status certbot.timer
```

### Create SSL Certificate
1) Let's Encrypt Method
```
sudo certbot certonly --manual --agree-tos --preferred-challenges dns -d domain-name.com -d *.domain-name.com
sudo certbot certonly --standalone --agree-tos --preferred-challenges http -d domain-name.com //get a standalone ssl cert
```

2) Self-signed Method
```
sudo openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365
```

### Nginx
```
sudo apt install python3-certbot-nginx
sudo certbot --nginx --agree-tos --preferred-challenges http -d domain-name.com
```

### Apache
```
sudo apt install python3-certbot-apache
sudo certbot --apache --agree-tos --preferred-challenges http -d domain-name.com
```

## GNU Privacy Guard (Certificate Keys)

Generating gpg keys
```
gpg --gen-key

sudo apt install rng-tools5
rngd -r /dev/urandom //installing random generator to help improve time it takes to generate key
```

Exporting/Importing gpg keys
```
gpg --export [email] > [filename.pub]
gpg --import [filename.pub]
gpg --list-keys //check the keys already imported
```

Encrypting/Decrypting Files
```
gpg --out [encyrpted filename] --recipient [email] --encrypt [original filename]
gpg --out [decrypted filename] --decrypt [encrypted filename]
```

Signage of Files
```
gpg --out [signed filename] --sign [unsigned filename] //signing file

gpg --out [verified encrypted filename] --verify [signed filename] //verify signed file
    gpg --out MessageFromCB.gpg --verify signed-filename
gpg --out [undecrypted filename] --decypt [encrypted filename] //decrypt file
    gpg --out MessageFromCB.txt --decrypt MessageFromCB.gpg
```

Revoking a Key
```
gpg --out [key revocation filename] --gen-revoke
```

### Resources
- https://serverspace.io/support/help/how-to-get-lets-encrypt-ssl-on-ubuntu/
- https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl
- https://stackoverflow.com/questions/9380403/what-does-ssl-ctx-use-privatekey-file-problems-getting-password-error-indica

