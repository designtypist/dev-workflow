# Configurations
> A list of configurations

#ZSH
---

### 1) Install ZSH, Oh-My-Zsh, Antigen
  Install [zsh](https://www.zsh.org/)
```
sudo apt-get install zsh -y
```

Install [oh-my-zsh](https://ohmyz.sh/)
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install [Antigen](http://antigen.sharats.me/)
> Make .antigen directory in your home directory and download antigen.zsh
```
cd ~/ && mkdir .antigen && cd ~/.antigen
curl -L git.io/antigen > antigen.zsh
```

### 2) Open a terminal and change the shell of your terminal to Zsh
```
chsh -s $(which zsh)
```
- Logout and log back in
- When prompted by Zsh for how to set up the configurations, press `2` to have it create a default one for you.

### 3) Create and modify zsh and antigen configurations

Open .zshrc probably found in your home directory and add these lines to the bottom.
```
# Load Antigen
source ~/.antigen/antigen.zsh

# Load Antigen configrations
antigen init ~/.antigenrc
```

Create .antigenrc in your home directory (~/) and add these lines.
> **HINT:** Modify the bundle section to your own perferences. Here is a list of [ohmyzsh plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
```
# Load oh-my-zsh library.
antigen use oh-my-zsh

# Load bundles from the default repo (oh-my-zsh).
antigen bundle git
antigen bundle ssh
antigen bundle nvm
antigen bundle command-not-found

# Load bundles from external repos.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Select theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply
```

Other Resources if you want more clarity:
- https://blog.phuctm97.com/zsh-antigen-oh-my-zsh-a-beautiful-powerful-robust-shell
