#!/bin/bash

# update and upgrade
sudo apt-get update && sudo apt-get upgrade -y

# zsh, ohmzsh, antigen
sudo apt-get install zsh -y
## ohmyzsh - plugins (https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## antigen
cd ~/ && mkdir .antigen
curl -L git.io/antigen > antigen.zsh

# vim, vundle
sudo apt-get install vim -y

# git, byobu, htop
sudo apt-get install byobu git htop screen -y

# screen setup
mkdir ~/.screen && chmod 700 ~/.screen
export SCREENDIR=$HOME/.screen

# docker
sudo apt install docker.io
## add user to docker group
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

# npm with nvm (node version manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
## install latest lts version of node
nvm install --lts
nvm use --lts

# Extras
---
# docker-compose, git-lfs, php-cli
sudo apt install docker-compose
sudo apt install git-lfs
sudo apt install php7.4-cli

# python, pip
sudo apt install python3
sudo apt install python3-pip
pip3 install ansible - 'pip3 install ansible==2.4.0.0 - trellis usage' 

# pnpm, yarn
npm install -g pnpm
npm install -g yarn

# composer
wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php -- --quiet
mv composer.phar /usr/local/bin/composer

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## xml-writer, mbstring
sudo apt install php-xmlwriter
sudo apt install php-mbstring

# virtual machines
sudo apt-get install virtualbox
sudo apt-get install vagrant

