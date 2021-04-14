#!/usr/bin/bash

if [ $USER != 'ari' ];
then
	exit -1
fi

rm -rf $(find . | grep -i "readme")

rm -rf arch/
rm -rf bye_gdm.arch.sh
rm -rf clean_gnome.arch.sh
rm -rf gnome_repair.arch
rm -rf _.icons.zip
rm -rf LICENSE
rm -rf patch_fish/
rm -rf README.md
rm -rf svcs.arch.sh
rm -rf _.themes.zip
rm -rf Xenlism-Arch/

cp /etc/fish/config.fish config.fish
cp /home/ari/.config/fish/functions/fish_prompt.fish fish_prompt.fish
cp /home/ari/.config/fish/fish_variables fish_variables
cp /etc/nanorc nanorc
cp /etc/lightdm/lightdm.conf lightdm.conf

cp /home/ari/.xinitrc i3/_.xinitrc
cp -r /home/ari/.config/i3 i3/_.config
cp -r /home/ari/.config/i3blocks i3/_.config
cp -r /home/ari/.config/i3status i3/_.config
cp -r /home/ari/.config/picom i3/_.config
cp -r /home/ari/.config/rofi i3/_.config
cp -r /home/ari/.config/scripts i3/_.config
cp -r /home/ari/.config/terminator i3/_.config
cp -r /home/ari/.config/Thunar i3/_.config

cp /usr/share/rofi/themes/onedark.rasi i3/_.config/rofi
cp /etc/xdg/reflector/reflector.conf reflector.conf

rm -rf i3/_.config/i3/config.save*
