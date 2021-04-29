#!/bin/bash

# gdebi-core (must-have)
sudo apt install gdebi-core

# synaptic (apt dependency manager) && stacer (linux system optimization)
sudo apt-get install synaptic && sudo apt-get install stacer

# cryptomator 
sudo add-apt-repository ppa:sebastian-stenzel/cryptomator
sudo apt-get update && sudo apt-get install cryptomator -y

# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https | 
sudo apt-get update && sudo apt-get install code -y

# brave browser
sudo apt install apt-transport-https curl
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update && sudo apt-get install brave-browser -y

# filezilla
sudo apt-get install filezilla

# activtiy watch
wget https://github.com/ActivityWatch/activitywatch/releases/download/v0.9.2/activitywatch-v0.9.2-linux-x86_64.zip #REMINDER: update version
unzip activitywatch-*.zip
rm activitywatch-*.zip
mkdir ~/apps && mv activitywatch ~/apps && cd ~/apps/activitywatch
./aw-qt # access via web using http://localhost:5600/

# spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y

# discord
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ./discord.deb
rm ./discord.deb

# [slack](https://slack.com/intl/en-ca/downloads/linux)
wget https://downloads.slack-edge.com/linux_releases/\slack-desktop-4.11.1-amd64.deb #REMINDER: update version
sudo gdebi ./slack-desktop-*.deb
rm ./slack-desktop-*.deb
