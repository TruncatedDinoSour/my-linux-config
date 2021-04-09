timedatectl set-ntp true
timedatectl set-timezone FULL_TIMEZONE
reflector --age 10 --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy
gdisk /dev/DRIVE_NAME_HERE
# make a new 300M efi partition partition and one linux partition that takes up the rest
mkfs.fat -F32 /dev/FIRST_PARTITION_NAME
mkfs.ext4 /dev/SECOND_PARTITION_NAME
mount /dev/SECOND_PARTITION_NAME /mnt
mkdir -p /mnt/boot/efi
mount /dev/FIRST_PARTITION_NAME /mnt/boot/efi
pacstrap /mnt base linux linux-firmware nano [PROCESSOR]-ucode
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
dd if=/dev/zero of=/swapfile bs=1024 count=SWAPFILE_SIZE_IN_MiB status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
nano /etc/fstab
# add:
# /swapfile       none        swap        defaults      0 0
timedatectl set-timezone [TIMEZONE]
ln -sf /usr/share/zoneinfo/[TIMEZONE] /etc/localtime
hwclock --systohc
nano /etc/locale.gen
# uncomment your locale
locale-gen
/etc/locale.conf
# add LANG=[LOCALE]
echo 'YOUR-HOST-NAME' > /etc/hostname
nano /etc/hosts
# add
# 127.0.0.1       localhost
# ::1             localhost
# 127.0.1.1       YOUR-HOST-NAME.localdomain	YOUR-HOST-NAME
passwd
pacman -S grub efibootmgr networkmanager network-manager-applet dialog mtools dosfstools base-devel linux-headers bluez bluez-utils cups alsa-utils pulseaudio pulseaudio-bluetooth git reflector xdg-utils xdg-user-dirs
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable cups
systemctl enable bluetooth
useradd -mG wheel USERNAME_HERE
passwd USERNAME_HERE
EDITOR=nano visudo
# uncomment:
## Uncomment to allow members of group wheel to execute any command
# %wheel ALL=(ALL) ALL
exit
umount -a
reboot
