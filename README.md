### make sure you replace /home/ari/ with /home/your-username-here/ or ~/
##### if anything breaks please make sure to have logs, for example what you ran and what was the output

![](https://user-images.githubusercontent.com/71613062/113663394-7b6f8180-9699-11eb-9147-631b7f2600da.png)

**My version of GNOME is *~500MiB* IDLE**

### CONTENTS
```text
config.fish - systemwide fish config [/etc/fish/config.fish]
nanorc - nano rc file [/etc/nanorc]
Xenlism-Arch - grub theme i use (SEE CREDITS)
.config/ (_.themes.zip) - some app configs [~/.config/]
.icons/ (_.icons.zip) - icons and cursors [~/.icons] (SEE CREDITS)
.themes/ - gnome themes [~/.themes/] (SEE CREDITS)
patch_fish/ - modifies your fish to look better
clean_gnome.arch.sh - removes unnecessary packages that come with gnome
bye_gdm.arch.sh - removes GDM and replaces it with lightdm
gnome_repair.arch/ - fixes common problems i had with my scripts (run them one by one and see if they fix your issue, if one worked - don't run the other, reboot after every attempt) 
svcs.arch.sh - enables services to make your computer and packages run smoother
fish_prompt.fish - my edited version of learance Fish Theme (~/.config/fish/functions/fish_prompt.fish)
```

### packages (arch linux)
```shell
# OFFICIAL REPOS
sudo pacman -S fish nano gnome gnome-tweaks
# AUR
yay -S gnome-terminal-transparency nerd-fonts-hack chrome-gnome-shell

```

### CREDITS
[Xenlism Grub Theme](https://www.gnome-look.org/p/1440862/)<br/>
[Bibata Cursors](https://www.gnome-look.org/p/1197198/)
[Clearance Fish Theme](https://github.com/oh-my-fish/theme-clearance/)

### gnome extensions i use
[dynamic-panel-transparency](https://extensions.gnome.org/extension/1011/dynamic-panel-transparency/)<br/>
[hide-activities-button](https://extensions.gnome.org/extension/1128/hide-activities-button/)<br/>
[horizontal-workspaces](https://extensions.gnome.org/extension/2141/horizontal-workspaces/)<br/>
[native-window-placement](https://extensions.gnome.org/extension/18/native-window-placement/)<br/>
[panel-osd](https://extensions.gnome.org/extension/708/panel-osd/)<br/>
[shelltile](https://extensions.gnome.org/extension/657/shelltile/)<br/>
[user-themes](https://extensions.gnome.org/extension/19/user-themes/)<br/>
[window-is-ready-notification-remover](https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/)

### etc.
[wallpaper](https://user-images.githubusercontent.com/71613062/113638855-5bbf6580-9667-11eb-992d-5d13080b92ae.jpg)
