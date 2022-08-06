# Vim

### Usage
Moving in VI
- [G] -> jump to last line
- [gg] -> jump to first line
- :line # -> jump to line number specified
- [hjkl] -> move cursor

Deletion
- [x] -> delete char
- [dw] -> delete word
- [dd] -> delete line

Search
- ?[search filter] or /[search filter] -> search item
- :s/[search filter]/[replace] -> replace single search item
    - :s/root/ROOT
- :%s/[search filter]/[replace] -> replace multiple search items
    - :%s/login/LOGIN

Run Commands inside VI!
- : r ![command]
    - : r !date

Join line in VI
- [J] -> join line with next line

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
