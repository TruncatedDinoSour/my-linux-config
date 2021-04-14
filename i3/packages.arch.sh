#!/usr/bin/bash

aur_helper_install="paru -S --needed"
sudo_command="sudo"

echo 'installing python and pip'
$aur_helper_install python3 python-pip


echo 'installing important packages'
$aur_helper_install i3-gaps xorg i3status i3lock-color i3blocks xorg-xinit rofi terminator


echo 'installing extra packages'
$aur_helper_install autotiling-git picom ttf-font-awesome lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings lxappearance fish git


echo 'installing fish'
chsh -s /usr/bin/fish
$sudo_command chsh -s /usr/bin/fish


echo 'enabling lightdm'
$sudo_command systemctl enable lightdm

echo 'Done!'
