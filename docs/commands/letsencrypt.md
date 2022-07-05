# Let's Encrypt

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

### Resources
- https://serverspace.io/support/help/how-to-get-lets-encrypt-ssl-on-ubuntu/
- https://stackoverflow.com/questions/10175812/how-to-generate-a-self-signed-ssl-certificate-using-openssl
- https://stackoverflow.com/questions/9380403/what-does-ssl-ctx-use-privatekey-file-problems-getting-password-error-indica
