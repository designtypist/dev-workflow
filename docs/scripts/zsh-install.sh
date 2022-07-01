#/bin/bash

# zsh install
sudo apt install zsh -y
chsh -s $(which zsh)

# ohmyzsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)/"

# ohmyzsh plugins
# read -p "ZSH plugins [spaces between each]: " zshplugins
# read -p "ZSH theme [spaces between each]: " zshthemes

# load configuration
cat ../configs/.antigen/zsh.conf >> ~/.zshrc

# antigen installation
cd ~/ && mkdir .antigen && cd ~/.antigen
curl -L git.io/antigen > antigen.zsh

# antigen configuration
cd ~ && touch .antigenrc
cat ../configs/.antigenrc >> ~/.antigenrc

# load configurations
source ~/.zshrc
