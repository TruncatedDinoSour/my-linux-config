#!/usr/bin/bash

# disabling GDM
sudo systemctl disable gdm

# removing gdm
sudo pacman -R gdm

# removing leftovers
for _ in {1...5}
do
sudo pacman -Rsn $(pacman -Qdtq)
done

# installing lightdm
sudo pacman -S lightdm lightdm-gtk-greeter

# enabling lightdm
sudo systemctl enable lightdm
