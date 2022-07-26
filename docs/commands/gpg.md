# GNU Privacy Guard (Certificate Keys)

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
