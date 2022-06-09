# Power Saving
> Linux tools to lower power consumption

### Powertop - A power consumption and power management diagnosis tool
```
sudo apt install powertop
sudo powertop
```

### TLP - Apply laptop power saving settings
```
sudo apt install tlp tlp-rdw
sudo tlp start //reboot after

sudo systemctl status tlp.service
sudo systemctl enable tlp.service
sudo tlp-stat //display detailed info
```

### Turn off wireless and/or bluetooth card
Turn off bluetooth card
```
sudo systemctl disable bluetooth
systemctl is-enabled bluetooth
systemctl stop bluetooth
```

Turn off wireless card
```
ifconfig //check wifi card name
sudo ifconfig [wifi card name] down
    ie) sudo ifconfig wlp4s0 down
sudo ifconfig [wifi card name] up
```

### Resources:
- [Ubuntu user less power and improve battery life](https://help.ubuntu.com/stable/ubuntu-help/power-batterylife.html.en)
