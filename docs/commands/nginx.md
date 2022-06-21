# NGINX setup

### 1) Installation
```
sudo apt-get install nginx
```

### 2) Firewall UFW allow port
```
sudo ufw allow ['Nginx Full'/'Nginx HTTP'/'Nginx HTTPS']
sudo ufw status
```

### 3) Check web server
```
sudo systemctl [status/reload/restart/start/stop/enable/disable] nginx
curl -4 icanhazip.com
```

### 4) Setup nginx for use
Setup web page directory
```
sudo mkdir -p /var/www/[your_domain]/html
sudo chown -R $USER:$USER /var/www/[your_domain]/html
//add web pages in directory
```

Set up nginx configuration
```
sudo vim /etc/nginx/sites-available/[your_domain]
sudo ln -s /etc/nginx/sites-available/[your_domain] /etc/nginx/sites-enabled/
sudo nginx -t //check for syntax errors
sudo systemctl restart nginx
```

Nginx log files
```
sudo tail -30 /var/log/nginx/access.log
sudo tail -30 /var/log/nginx/error.log
```

### Resources
- [nginx installation and setup](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04)


