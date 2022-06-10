# Power Saving
> Linux tools to lower power consumption

### Upower - Monitor activity from the power deamon
```
upower --monitor-detail
```

### Powertop - A power consumption and power management diagnosis tool
```
sudo apt install powertop
sudo powertop --calibrate //run power diagnostic
sudo powertop --csv=powertop_report.txt --time=20s //output to csv report
powertop --html=powertop //generate html report

sudo systmctl start powertop.service //service that helps to automatically set all turnables to good for optimal power savings
sudo systmctl enable powertop.service //make daemon service start at boot time
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
