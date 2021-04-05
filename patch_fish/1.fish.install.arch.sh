#!/usr/bin/sh

# install fish
sudo pacman -Syyu
sudo pacmna -S fish

# change the shell to fish
chsh -s /usr/bin/fish
sudo chsh -s /usr/bin/fish

echo 'plese reboot or re-log in for changes to take place'
