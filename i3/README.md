### MAKE SURE YOU REPLACE /home/ari/ WITH /home/[your-username-here] OR ~/
***this i3 build is ~300MiB RAM IDLE due to the compositor, extra software and services i have installed***
<br/>

#### please note:
  * install all packages needed for this config to work:
    * i3-gaps
    * xorg
    * compton/picom
    * i3lock-color
    * i3blocks
    * xorg-xinit
    * rofi
    * terminator
    * ttf-font-awesome
    * lightdm (optional)
  * edit the configs, the defaults might not work for you
  * if you face any issue - make an issue on this github repo, make sure to have:
    * what you ran
    * what was the error
    * at what line did the error occur
    * do you have all dependencies installed

<br/>

![](https://user-images.githubusercontent.com/71613062/114950746-3db1ec00-9e43-11eb-866a-d7242d0acab7.png)

## CONTENTS
```
_.xinitrc - xinit configuration [~/.xinitrc]
packages.arch.sh - installs needed and extra packages for i3 [NULL]
transfer.configs.sh - transfer configuration files to their proper directories [NULL]
_.config/ - configuration files
  |
  \ i3/ - i3 configuration [~/.config/i3/]
    \ config - i3 configuration file [~/.config/i3/config]
  \ i3blocks/ - i3blocks configuration [~/.config/i3blocks/]
    \ i3blocks.conf - configuration file for i3blocks [~/.config/i3blocks/i3blocks.conf]
  \ i3status\ - i3 statusbar config [~/.config/i3status/]
    \ i3status.conf - configuration file for i3 status [~/.config/i3status/i3status.conf]
  \ picom/ - picom compositor configuration [~/.config/picom/]
    \ picom.conf - picom configuration file [~/.config/picom/picom.conf]
  \ rofi/ - rofi app launcher [~/.config/rofi/]
    \ config - main configuration file [~/.config/rofi/config]
    \ onedark.rasi - rofi theme file [/usr/share/rofi/themes/onedark.rasi] (SEE CREITS)
  \ scripts/ - i3 status widgets [~/.config/scripts/]
    \ [executable files (SEE ETC.)] [~/.config/scripts/...]
  \ terminator - terminaor terminal config [~/.config/terminator]
    \ config - main configuration file [~/.config/terminator/config]
  \ Thunar
    \ rhunar file manager config
 ```
 
## CREDITS
[Rofi OneDark Theme](https://github.com/davatorium/rofi-themes/blob/master/User%20Themes/onedark.rasi)<br/>
[i3 WM Mini Series By EF linux](https://www.youtube.com/playlist?list=PL7UuKajElTaCn3bAVIXAcQPtUhX3NKx4-)<br/>
 
## ETC.
[i3Blocks - Status Bar Widgets](https://github.com/vivien/i3blocks-contrib/)<br/>
[EF linux i3 configuration file](https://gitlab.com/eflinux/i3)<br/>
[Wallpaper](https://user-images.githubusercontent.com/71613062/114439076-1a274100-9bb8-11eb-9067-ba66d22f517a.jpg)<br/>
[GTK Gruvbox Dark Theme](https://aur.archlinux.org/packages/gruvbox-dark-gtk/)<br/>
[gruvbox-material-icon-theme-git](https://aur.archlinux.org/packages/gruvbox-material-icon-theme-git/)
