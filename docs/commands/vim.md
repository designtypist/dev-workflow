# Vim

### Basic configuration setup
[Basic configuration](git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh)
```
cd ~
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh
```

### Setup vim configuration for root user
```
sudo su
sudo rm -r /root/.vim
ln -s /home/$USER/.vimrc .vimrc
ln -s /home/$USER/.vim .vim
```
