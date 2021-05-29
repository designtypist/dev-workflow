#/bin/bash

# open ssh server
sudo apt-get install openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh

# cockpit
sudo apt-get install cockpit -y

  ## add neccessary group for cockpit users (systemd-journal, adm, [wheel](https://wiki.debian.org/WHEEL/PAM))
  sudo vi /etc/pam.d/su 
    # auth required pam_wheel.so //remove `#`
  addgroup --system wheel
  usermod -a -G systemd-journal,adm,wheel $USER
  
# mysql and mariadb
sudo apt-get install mysql-server
sudo apt-get install mariadb-server
sudo apt-get install libmariadbclient-dev
sudo apt-get install libmysqlclient-dev
sudo apt install mariadb-client-core-10.3

# portainer
docker run -d --name="portainer" --restart on-failure -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

# yacht
docker volume create yacht
docker run -d --name="yacht" -p  8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config selfhostedpro/yacht

  # default: 
    # username: admin@yacht.local
    # password: pass
