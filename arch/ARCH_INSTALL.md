### ARCH LINUX INSTALLATION ON UEFI SYSTEMS
***

**1. Boot into the archiso**<br/>
- This step is as easy as flashing your USB or an SD card and booting into it, you can flash your devices/cards using [rufus (for windows)](https://rufus.ie/en/) or [etcher (for mac/linux)](https://www.balena.io/etcher/), if they don't work [search up](https://duckduckgo.com/) ***"How do i flash [device] on [system]"***, replace [device] with "an sd card" or "a usb flash drive" depending on what you want to flash and [system] with your current operating system, like "linux", "mac os" or "windows".
  - [Booting into oses on MAC computers](https://www.acronis.com/en-us/articles/usb-boot/)
  - [Booting into oses on WINDOWS computers](https://www.digitalcitizen.life/boot-your-windows-10-pc-usb-flash-drive/)

<br/>

**2. Set your keymap (Skip this step if you have an american QWERTY keyboard, which is probably the case)**<br/>
  before loading your keymap you need to find your keymap:
```shell
localectl list-keymaps
```
  - to make the output as small as possible you can search it using your [country code](https://en.wikipedia.org/wiki/Country_code):
```shell
localectl list-kaymaps | grep "YOUR_COUNTRY_CODE"
```
  - for example to find the lithuanian keyboard:
```shell
$ localectl list-keymaps | grep -i "lt"
de_alt_UTF-8
ky_alt_sh-UTF-8
lt
lt.baltic
lt.l4
ruwin_alt-CP1251
ruwin_alt-KOI8-R
ruwin_alt-UTF-8
ruwin_alt_sh-UTF-8
sun-pl-altgraph
tj_alt-UTF8
tralt
ttwin_alt-UTF-8
```
  - I'd need to pick the one i need, you can google what they mean and pick the one you need.<br/>
  - after you find your keymap you need to load it, in your terminal type:
```shell
loadkeys YOUR_KEYMAP
```
  - for a lithuanian keyboard i'd do:
```shell
loadkeys lt
```
  - if something failed, [follow this](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)

<br/>

**3. Check your connection**<br/>
- you can check that by entering
```shell
ping google.com
```
- in the command promt you now see on your screen when you booted into the ISO<br/>
- if it doesn't print:
```
ping: google.com: Name or service not known
```
- or
```
ping: google.com: Couldn't resolve the host
```
- you have a connection.<br/>
- else to get out of the `ping` command press `CTRL + C` together at the same time (should appear as `^C`), then try - to follow the guide on [setting up wireless network](https://wiki.archlinux.org/index.php/Network_configuration/Wireless) on arch linux, though my suggestion would be using [usb tethering (on android)](https://techviral.net/get-usb-tethering-working-on-android/) or [usb tethering (on ios)](https://support.speedify.com/article/426-connect-pc-tethered-iphone-usb).

<br/>

**4. Enable [network-time-protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol)**
  #### MAKE SURE YOU HAVE A CONNECTION ON THIS STEP
  - this will automatically set time for you using your network:
```shell
timedatectl set-ntp true
```

<br/>

**5. Set your timezone**
  - find your timezone:
```shell
timedatectl list-timezones
```
  - find the nearest city to you, to make the output more readable do
```shell
timedatectl list-timezones | grep -i "YOUR_CONTINENT"
```
  - for example if you live in europe:
```shell
timedatectl list-timezones | grep -i "europe"
```
  - then when you find the city nearest you type:
```shell
timedatectl set-timezone FULL_TIMEZONE
```
  - if you were in germany for example:
```shell
timedatectl set-timezone Europe/Zurich
```
  - if soemthing fails try:
```shell
timedatectl set-ntp false
```
  - then reapply your timezone again and then
```shell
timedatectl set-ntp true
```

<br/>

**6. refresh your mirrorlist**
  #### MAKE SURE YOU HAVE A CONNECTION ON THIS STEP
  - we need to have a fast mirrorlist so we wouldn't need to wait for hours for out packages to download, we'll need packages while installing the system, to get a fast mirrorlist type:
```shell
reflector --age 10 --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
```
  - do not disconnect the connection while it's running, this step might take some time, you can can make a cup of tea while its doing its thing, it might spit out some warnings, but ignore them, if you lose the connection when its running you will get a bunch of warnings that it couldn't resolve the host, then you need to re-run the command.

<br/>

**7. sync your servers**
  #### MAKE SURE YOU HAVE A CONNECTION ON THIS STEP
  - this step will sync your pacman servers, run this in the terminal:
```shell
pacman -Syy
```

<br/>

**8. PARTITIONING**
  - first we need to find the drive to partition, type this in the terminal:
```shell
lsblk
```
  - you should see the drive, it should be named like "vda", "sda", "nvme0n1", etc; for example this is my output:
```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sr0          11:0    1  1024M  0 rom  
nvme0n1     259:0    0 238.5G  0 disk 
├─nvme0n1p1 259:1    0   300M  0 part /boot/efi
└─nvme0n1p2 259:2    0 238.2G  0 part /
```
  - my main disk is nve0n1 as it's the biggest, it's type is "disk" and it already has an os.
  - we'll use a partitioning utilify "gdisk", so now type:
```shell
gdisk /dev/DRIVE_NAME_HERE
```
  - if i was installing arch, i'd need to type:
```shell
gdisk /dev/nvme0n1
```
  - now we'll erase ***all data and partitions*** on the drive, did you make a backup of your important files?
  - in `gdisk` you probably got another prompt:
```
Command (? for help):
```
  - in that prompt type the letter `o` and press `enter`
  - if it asks you "do you want to erase all data on the drive" agree to it, it will delete everything on the drive
  - now if you're still in that prompt type `w` and agree to it, then follow the next step
  - if you're in the normal prompt (with an `#`) type:
```shell
gdisk /dev/YOUR_DISK_NAME
```
  - we will now create the EFI partition.
  - in gdisk prompt now type:
```shell
n
```
  - when it asks you for the partition number press enter or enter `1`
  - the first sector should be fine, so press enter when it asks you about the first sector or enter `2048`
  - when it asks you for the last sector enter:
```shell
+300M
```
  - this will create a new 300M partition for our EFI.
  - now it should ask "Hex code or GUID", this will set the type of our partition, the default one will be "linux filesystem", but we need "EFI filesystem", so in that prompt enter:
```shell
ef00
```
  - that's the code for the efi filesystem
  - now you should have a noral prompt, above it it should say "changed type of partition to 'EFI system partition'" or something similar to it.
  - now let's create our / partition
  - in gdisk prompt type:
```shell
n
```
  - when it asks you for the partition number press enter or enter `1`
  - the first sector should be fine, so press enter when it asks you about the first sector or enter `2048`
  - when it asks you for the last sector press enter, it should take up the whole disk that is left
  - when it asks for a Hex code or GUID, just press enter or type `8300`
  - now in the main prompt (`Command (? for help):`) type:
```
w
```
  - press anter and agree when it asks "do you want to write changes to the disk"
  - when it's done you should be in the normal prompt (with an `#`), in the terminal type:
```shell
lsblk
```
  - this should look something like this:
```
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sr0          11:0    1  1024M  0 rom  
nvme0n1     259:0    0 238.5G  0 disk 
├─nvme0n1p1 259:1    0   300M  0 part
└─nvme0n1p2 259:2    0 238.2G  0 part
```
  - now we'll format the partitions, please remember:
    - partition 1 = our EFI partition, 300M
    - partition 2 = our root partition, the rest of the disk
  - formatting partition 1 - EFI, type this in the terminal:
```shell
mkfs.fat -F32 /dev/FIRST_PARTITION_NAME
```
  - you can find out your partition paths using `lsblk` and taking the first branch, for example:
```
╭─ ari at ari-arch in ~
╰⟩ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sr0          11:0    1  1024M  0 rom  
nvme0n1     259:0    0 238.5G  0 disk 
├─nvme0n1p1 259:1    0   300M  0 part /boot/efi
└─nvme0n1p2 259:2    0 238.2G  0 part /
╭─ ari at ari-arch in ~
╰⟩ # nvme0n1p1 is my first partition, nvme0n1p2 is my second one:)
```
  - if i was installing arch:
```shell
mkfs.fat -F 32 /dev/nvme0n1p1
```
  - now our / partition
```shell
mkfs.ext4 /dev/SECOND_PARTITION_NAME
```
  - if i was installing arch
```shell
kfs.ext4 /dev/nvme0n1p2
```
  - now let's mount out partitions:
  - first let's mount our root (second) partition
```shell
mount /dev/SECOND_PARTITION_NAME /mnt
```
  - mnt is our installation directory
  - now we'll need to make the EFI folder for our system, to make them do:
```shell
mkdir -p /mnt/boot/efi
```
  - let's mount the EFI partition now
```shell
mount /dev/FIRST_PARTITION_NAME /mnt/boot/efi
```
  - now when you type `lsblk` again, you should see something like:
```
nvme0n1     259:0    0 238.5G  0 disk 
├─nvme0n1p1 259:1    0   300M  0 part /mnt/boot/efi
└─nvme0n1p2 259:2    0 238.2G  0 part /mnt
```

<br/>

**9. installing required base packages**
  #### MAKE SURE YOU HAVE A CONNECTION ON THIS STEP
  - now we'll install the base packages, in your terminal type:
```shell
pacstrap /mnt base linux linux-firmware nano [PROCESSOR]-ucode
```
  - in `[PROCESSOR]-ucode` you need to replace the processor with your processor name, for example for intel cpus it will be `intel-ucode` and for amd processors - `amd-ucode`
  - then hit enter when you're ready
  - when all packages install we'll generate the filesystem table (fstab), in the terminal type:
```shell
genfstab -U /mnt >> /mnt/etc/fstab
```
  - now we ca enter the installaion! in the terminal type:
```shell
arch-chroot /mnt
```
  - the prompt should've changed from coloured to not coloured

<br/>

**10. making a swapfile**
  - swapfile is a file where your processes go when you run out of ram, please use these rules:
    - below 6 GB of RAM:
      - swapfile = RAM * 2
    - 6 - 12 GB
      - swapfile = ram / 2
    - 14+ GB
      - no swap (if you want swap - 2GB)
  - now let's create a swapfile:
```shell
dd if=/dev/zero of=/swapfile bs=1024 count=SWAPFILE_SIZE_IN_MiB status=progress
```
  - if i wanted to create a 2GB swapfile i'd do:
```shell
dd if=/dev/zero of=/swapfile bs=1024 count=2048 status=progress
```
  - we need to make the swapfile readable:
```shell
chmod 600 /swapfile
```
  - making the swap:
```shell
mkswap /swapfile
```
  - turning the swap on
```shell
swapon /swapfile
```
  - adding the swapfile into out fstab
  - we need to first open fstab in an editor:
```shell
nano /etc/fstab
```
  - then add this line to a new line in it (big spaces = `tab`s):
```shell
/swapfile       none        swap        defaults      0 0
```
  - to exit out of nano press `CTRL` + `X` and then press `y` and `enter` to save the file

<br/>

**11. locales**
  - [locales](https://docs.microsoft.com/en-us/windows/win32/intl/locales-and-languages) defines your language, money and other formats, etc.
  - set our timezone (**refer to step 5**):
   - find our timezone:
```shell
timedatectl list-timezones
```
   - set out timezone
```shell
timedatectl set-timezone [TIMEZONE]
ln -sf /usr/share/zoneinfo/[TIMEZONE] /etc/localtime
```
   - for example if you were from lithuania:
```shell
timedatectl set-timezone Europe/Vilnius
ln -sf /usr/share/zoneinfo/Europe/Vilnius /etc/localtime
```
  - sync our hardware clock
```shell
hwclock --systohc
```
  - select your locale
    - we need to type `nano /etc/locale.gen` and select a locate and generate it, the locale file is located in `/etc/locale.gen`, you need to select a locale yourself, for exale if you wanted american english you'll need to find `en_US.UTF-8 UTF-8`, only select locales that end in `UTF-8`, for british english you'll need `en_GB`, etc. to select the locale when you find it you need to remove the `#` in front of the locale, for example you need to make
```shell
# ...
# en_US.UTF-8 UTF-8
# ...
```
  - into
```shell
# ...
en_US.UTF-8 UTF-8
# ...
```
  - after you find your locale, in the terminal type:
```shell
locale-gen
```
  - creating `locale.conf`
    - this is where you will define your language
```shell
LANG=[LOCALE]
```
  - for example - british english
```shell
LANG=en_GB.UTF-8
```
  - if you picked another key layout, you need to type this:
```shell
nano /etc/vconsole.conf
```
  - and add this:
```shell
KEYMAP=YOUR_KEYMAP
```

**12. hostname and hosts**
  - hostname
    - select your host name (computer name) and type:
```shell
echo 'YOUR-HOST-NAME' > /etc/hostname
```
  - hosts
    - in the terminal type `nano /etc/hosts` and add this to that file (big spaces = `tab`s, also replace YOUR-HOST-NAME with your hostname (/etc/hostname has it))
```shell
127.0.0.1       localhost
::1             localhost
127.0.1.1	      YOUR-HOST-NAME.localdomain	YOUR-HOST-NAME
```

<br/>

**13. root password**
  - type this in the terminal and give the root user a password, ***remember it or note it***:
```shell
passwd
```

<br/>

**14. extra packages (bootloader, networking, etc.)**
  #### MAKE SURE YOU HAVE A CONNECTION ON THIS STEP
  - type this in the terminal:
```shell
pacman -S grub efibootmgr networkmanager network-manager-applet dialog mtools dosfstools base-devel linux-headers bluez bluez-utils cups alsa-utils pulseaudio pulseaudio-bluetooth git reflector xdg-utils xdg-user-dirs
```
  - grub - our bootloader
  - efibootmgr - efi boot manager
  - networkmanager, network-manager-applet - helps configure network
  - dialog - display dialog boxes
  - mtools, dosfstools - tools to work with FAT32 filesystems
  - base-devel, linux-headers - development packages, might be useful
  - bluez, bluez-utils - bluetooth adapter
  - cups - our printing system
  - alsa-utils, pulseaudio, pulseaudio-bluetooth - audio system
  - git - comand line github manager
  - reflector - helps manage pacman mirrorlist
  - xdg-utils - mime type manager
  - xdg-user-dirs - addsdirectories to our /home/user/ like videos/, music/, downloads/

<br/>

**15. installing grub**
  - grub is a bootloader, to install it type this in your terminal:
```shell
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
```
  - generate grub configuration file
```shell
grub-mkconfig -o /boot/grub/grub.cfg
```

<br/>

**16. activating services**
  - we'll activate services for networkmanager, cups and bluez pacakges
  - networkmanager
```shell
systemctl enable NetworkManager
```
  - cups
```shell
systemctl enable cups
```
  - bluez
```shell
systemctl enable bluetooth
```

<br/>

**17. adding a new user**
  - creating the user
```shell
useradd -mG whell USERNAME_HERE
```
  - replace `USERNAME_HERE` with the username you want
  - explenation
    - G means we're giving it an extra group, which i gave wheel, wheel means it will have root privlages with the `sudo` command
    - m means that user will have a home directory
  - giving the user a password
    - replace `USERNAME_HERE` with the username you have to the user, type in the password and ***remember it or note it***
```shell
passwd USERNAME_HERE
```

<br/>

**18. adding sudo**
  - in terminal type:
```shell
EDITOR=nano visudo
```
  - scroll down until you see:
```shell
## Uncomment to allow members of group wheel to execute any command
# %wheel ALL=(ALL) ALL
```
  - it's below
```shell
##
## User privilege specification
##
root ALL=(ALL) ALL
```
  - and uncomment`%wheel ALL=(ALL) ALL`:
```shell
## Uncomment to allow members of group wheel to execute any command
%wheel ALL=(ALL) ALL
```

**19. exiting the installation**
  - woo, we did it, now we need to exit the installer and reboot, now type:
```shell
exit
```
  - when you're back in the coloured prompt type
```shell
umount -a
```
  - and then
```shell
reboot
```
  ### when the screen goes completely black unplug your usb or take out your sd card quickly

**20. finishing up**
  - now you should be greeted by the grub bootloader, press "boot arch linux", login as the user you created and if you want install a desktop environment and yay:
    - [how to install yay](https://github.com/Jguer/yay#installation)
    - [how to use pacman](https://linuxhint.com/pacman_arch_linux/)
  - you can also [configure your network](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/networking_guide/sec-network_bridging_using_the_networkmanager_command_line_tool_nmcli)
  - if you want to install gnome you need to enter:
```shell
sudo pacman -S gnome gnome-tweaks
```
