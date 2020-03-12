# Conky project
This is my own Conky project, now running on Ubuntu 19.
You should edit .conkyrc file with your interface and wttr curl on your location.

## Getting Started
```
sudo apt install conky jq curl
git clone git@github.com:GaldCZ/private.git
wget https://raw.githubusercontent.com/GaldCZ/private/master/conky/.conkyrc
mv .conkyrc /home/USER/
vim ~/.config/autostart/conky.desktop
....
[Desktop Entry]
Type=Application
Exec=/usr/bin/conky
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=conky
Name=conky
Comment[en_US]=
Comment=
....
#Change the network interface name to yours
conky &
```
<img src="https://github.com/GaldCZ/private/blob/master/conky/conky.png">
