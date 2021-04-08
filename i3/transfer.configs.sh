#!/usr/bin/sh

if [ $USER != 'ari' ]
then
	echo 'This files copies X11 files for easy transfer to github';
	exit 1;
fi

rm -rf .config/*

cp -r /home/ari/.config/i3* _.config/
cp -r /home/ari/.config/scripts _.config/
cp -r /home/ari/.config/picom/ _.config/
cp -r /home/ari/.config/rofi/ _.config/
cp -r /usr/share/rofi/themes/onedark.rasi _.config/rofi/
cp -r /home/ari/.xinitrc _.xinitrc
