# Web Server (LEMP)

## PHP setup
Installing PHP packages
```
sudo apt install php8.0 php8.0-bcmath php8.0-common php8.0-cli php8.0-curl php8.0-fpm php8.0-gd php8.0-mbstring php8.0-mcrypt php8.0-mysql php8.0-tokenizer php8.0-xml php8.0-zip
sudo apt install php8.1 php8.1-bcmath php8.1-common php8.1-cli php8.1-curl php8.1-fpm php8.1-gd php8.1-mbstring php8.1-mcrypt php8.1-mysql php8.1-tokenizer php8.1-xml php8.1-zip
sudo apt install php8.2 php8.2-bcmath php8.2-common php8.2-cli php8.2-curl php8.2-fpm php8.2-gd php8.2-mbstring php8.2-mcrypt php8.2-mysql php8.2-tokenizer php8.2-xml php8.2-zip
sudo apt install php8.3 php8.3-bcmath php8.3-common php8.3-cli php8.3-curl php8.3-fpm php8.3-gd php8.3-mbstring php8.3-mcrypt php8.3-mysql php8.3-tokenizer php8.3-xml php8.3-zip

php --modules //check php modules

sudo service php8.3-fpm enable
sudo service php8.3-fpm start
sudo service php8.3-fpm status
```

## Database setup

Installing Maria database server
```
sudo apt-get install mariadb-server
    sudo systemctl enable mariadb
    sudo systemctl start mariadb
sudo mysql_secure_installation
```

Using Maria database server
```
sudo mariadb -u [database_user] -p
 > CREATE DATABASE DATABASE_NAME;
 > GRANT ALL PRIVILEGES on DATABASE_NAME.* TO 'USER_NAME'@'%' identified by 'PASSWORD';
 > FLUSH PRIVILEGES;
 
 OR
 
 > CREATE USER 'username'@'%' IDENTIFIED BY 'supersecretpassword';
 > CREATE DATABASE db_name;
 > GRANT priv_type ON priv_level TO 'username'@'hostname';
    GRANT ALL PRIVILEGES ON DATABASE_NAME.* TO 'username'@'%';
 > FLUSH PRIVILEGES;
```

Import database from file
```
mysql -u username -p database_name < file.sql
```

## NGINX setup

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
    sudo systemctl enable nginx
	sudo systemctl start nginx
curl -4 designtypist.com
```

### 4) Setup nginx for use
Setup webapp directory
```
sudo chown -R $USER:$USER /var/www/[your_domain]/html

sudo find /var/www/project -type d -exec chmod 755 {} \;
sudo find /var/www/project -type f -exec chmod 644 {} \;

sudo chmod -R 775 /var/www/[your_domain]/html/cache
```

Set up nginx configuration
```
sudo vim /etc/nginx/sites-available/[your_domain]
sudo ln -s /etc/nginx/sites-available/[your_domain] /etc/nginx/sites-enabled/ OR 
    sudo ln -sf /etc/nginx/sites-available/* /etc/nginx/sites-enabled
sudo nginx -t //check for syntax errors
sudo systemctl reload nginx OR
    sudo service nginx reload
```

Nginx log files
```
sudo tail -30 /var/log/nginx/access.log
sudo tail -30 /var/log/nginx/error.log
```

## SSL/TLS setup

Installing and setting up Let's Encrypt
```
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d geektypist.ddns.net
sudo systemctl enable certbot.timer
```

## Server cache setup

Installing Redis server
```
sudo apt install redis-server
redis-server --version

sudo vim /etc/redis/redis.conf
    "supervised systemd" //setup supervised option to systemd
sudo systemctl restart redis.service
sudo systemctl enable redis-server.service
sudo systemctl status redis.service

sudo vim /etc/redis/redis.conf
    "requirepass [password]" //uncomment line and input secure password
sudo systemctl restart redis
```

Using Redis server
```
redis-cli
    auth [password]
```

## Supervisor setup
```
sudo apt-get install supervisor
```

### Resources
- [nginx installation and setup](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04)
- [redis installation and setup](https://www.fosstechnix.com/how-to-install-redis-on-ubuntu-24-04-lts/)
