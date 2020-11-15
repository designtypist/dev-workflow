# Configurations
> A list of configurations

#ZSH
---

### 1) Install ZSH, Oh-My-Zsh
  Install zsh
```
sudo apt-get install zsh -y
```

Install oh-my-zsh
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Make .antigen directory in home directory and download antigen.zsh
```
cd ~/ && mkdir .antigen
curl -L git.io/antigen > antigen.zsh
```

### 2) Load Zsh by opening a terminal (Steps still not done)

### 3) Create and modify zsh and antigen configurations

Open .zshrc and add these lines to the bottom
```
# Load Antigen
source ~/.antigen/antigen.zsh

# Load Antigen configrations
antigen init ~/.antigenrc
```

Create .antigenrc and add these lines
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

## VSCode
