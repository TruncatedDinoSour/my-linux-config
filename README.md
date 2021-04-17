### make sure you replace /home/ari/ with /home/your-username-here/ or ~/
##### if anything breaks please make sure to have logs, for example what you ran and what was the output
***
### I'm mostly on [i3](https://github.com/B00bleaTea/my-linux-config/tree/main/i3) now

**please note:**
  - fish has seperate directories for the normal and root user
    - user - ~/.config/fish/, root - /root/.config/fish/
  - not all scripts work on all distros, make sure you have the necesarry dependencies and that you're running a distro that can run that script
  - running gnome repair scripts will introduce back the gnome bloat or on final stage it will reinstall gnome - those scripts are for arch/arch-based distros only
  - not all gnome extensions work on all gnome versions
  - make an issue if you want to ask for more configs, setings, etc. :D
  - to install custom cursors and themes you will need the gnome-tweaks application
  - before making a PR check if the script is written in fish or bash, if it's written in fish submit only things that are written in fish, if bash - otherwise
  - to install grub themes you will need grub and you will need to get the official theme from the website as they have the most updated theme and an install script
  - don't be scared to make an issue to ask questions:)
  - not everything will work on every distro and machine, if you're having problems with paths in for exaple `config.fish`, remove the parts where it says:
    - "(people might want to remove these)"<br/>
     *if you're having general issues make an issue on this github repo:)*

***

*(ignore the GNOME 40 bug - black corners)*
![](https://user-images.githubusercontent.com/71613062/113895838-df3c9c00-97b8-11eb-80b5-0f54ce8982fc.png)

**My version of GNOME is *~500MiB* IDLE**

### CONTENTS
```text
fix_bpython.sh - fixes bpython
install_configs.sh - install configurations
svcs.arch.sh - enables services to make your computer and packages run smoother
alsa-restrore.sh - make alsa store previous session volume

config.fish - systemwide fish config [/etc/fish/config.fish]
nanorc - nano rc file [/etc/nanorc]
config.fish - fish aliases [/etc/fish/config.fish]
fish_prompt.fish - my edited version of clearance and lambda fish themes (~/.config/fish/functions/fish_prompt.fish)(SEE CREDITS)
fish_variables - fish variables (for example colours) [~/.config/fish/fish_variables]

.config/ (_.themes.zip) - some app configs [~/.config/]
.icons/ (_.icons.zip) - icons and cursors [~/.icons] (SEE CREDITS)
.themes/ - gnome themes [~/.themes/] (SEE CREDITS)
patch_fish/ - modifies your fish to look better
clean_gnome.arch.sh - removes unnecessary packages that come with gnome
bye_gdm.arch.sh - removes GDM and replaces it with lightdm
gnome_repair.arch/ - fixes common problems i had with my scripts (run them one by one and see if they fix your issue, if one worked - don't run the other, reboot after every attempt)
i3/ - my i3 configuration (more information there)
arch/ - heplful inforation about arch linux
```

### packages (arch linux)
```shell
# OFFICIAL REPOS
sudo pacman -S fish nano gnome gnome-tweaks
# AUR
yay -S gnome-terminal-transparency nerd-fonts-hack chrome-gnome-shell
# OH MY FISH
omf install archlinux
```

### CONTRIBUTORS
[cristian-tentella](https://github.com/cristian-tentella/)

### CREDITS
[Distro Grub Theme](https://store.kde.org/p/1482847/)<br/>
[Bibata Cursors](https://www.gnome-look.org/p/1197198/)<br/>
[Clearance Fish Theme](https://github.com/oh-my-fish/theme-clearance/)<br/>
[Lambda Fish Theme](https://github.com/hasanozgan/theme-lambda/)

### gnome extensions i use
[dynamic-panel-transparency](https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/)<br/>
[native-window-placement](https://extensions.gnome.org/extension/18/native-window-placement/)<br/>
[fullscreen-hot-corner](https://extensions.gnome.org/extension/1562/fullscreen-hot-corner/)<br/>
[just-perfection](https://extensions.gnome.org/extension/3843/just-perfection/)<br>
[tiling-assistant](https://extensions.gnome.org/extension/3733/tiling-assistant/)

### gnome extension configs
***dynamic pannel transparency***<br/>
![](https://user-images.githubusercontent.com/71613062/113896391-68ec6980-97b9-11eb-8c32-e1ed548d354c.png)<br/>

***just perfection***<br/>
![](https://user-images.githubusercontent.com/71613062/113897512-78b87d80-97ba-11eb-94b2-e0fb68eb7940.png)<br/>
![](https://user-images.githubusercontent.com/71613062/113897615-8ff76b00-97ba-11eb-9e35-7a1d33baee61.png)<br/>

***tiling assistant***<br/>
![](https://user-images.githubusercontent.com/71613062/113908264-db634680-97c5-11eb-9862-dafb6bea2897.png)<br/>
![](https://user-images.githubusercontent.com/71613062/113908052-a2c36d00-97c5-11eb-9218-891385d58a1d.png)<br/>

### etc.
[wallpaper](https://user-images.githubusercontent.com/71613062/113638855-5bbf6580-9667-11eb-992d-5d13080b92ae.jpg)<br/>
[Just a Touch Fish Theme (fish_config)](https://fishshell.com/docs/current/cmds/fish_config.html)<br/>
[i3 Page](https://github.com/B00bleaTea/my-linux-config/tree/main/i3)
