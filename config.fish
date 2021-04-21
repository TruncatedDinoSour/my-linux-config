# Put system-wide fish configuration entries here
# or in .fish files in conf.d/
# Files in conf.d can be overridden by the user
# by files with the same name in $XDG_CONFIG_HOME/fish/conf.d

# This file is run by all fish instances.
# To include configuration only for login shells, use
# if status is-login
#    ...
# end
# To include configuration only for interactive shells, use
# if status is-interactive
#   ...
# end

# variables
set sudo_command	"sudo"
set cli_editor		"vim"
set aur_helper		"paru"
set username		"ari"

# fish commands
alias edit-fish-aliases='/usr/bin/$sudo_command /usr/bin/$cli_editor /etc/fish/config.fish'
alias show-fish-aliases='/usr/bin/cat /etc/fish/config.fish | /usr/bin/grep "^alias"'
alias show-fish-config='/usr/bin/cat /etc/fish/config.fish'

# long commands
alias nanosync-h2r='/usr/bin/sudo /usr/bin/cp ~/.nanorc /etc/nanorc'
alias nanosync-r2h='/usr/bin/cp /etc/nanorc ~/.nanorc'

alias grub-remake='/usr/bin/$sudo_command /usr/bin/grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-config='/usr/bin/$sudo_command /usr/bin/$cli_editor /etc/default/grub'
alias get-grub-config='/usr/bin/cat /etc/default/grub'

alias edit-graphics-config='/usr/bin/$sudo_command /usr/bin/$cli_editor /etc/X11/xorg.conf.d/20-intel.conf'
alias get-hw-config='/usr/bin/cat /etc/X11/xorg.conf.d/20-intel.conf'
alias get-gdriver-info='/usr/bin/$sudo_command /usr/bin/lspci -k | /usr/bin/grep -EA3 \'VGA|3D|Display\''
alias get-hw='/usr/bin/$sudo_command /usr/bin/lspci'

alias edit-reflector-config='/usr/bin/$sudo_command /usr/bin/$cli_editor /etc/xdg/reflector/reflector.conf'
alias show-reflector-config='/usr/bin/cat /etc/xdg/reflector/reflector.conf'

alias installed-pks='/usr/bin/$aur_helper -Q'

alias ssh-enable="/usr/bin/sudo /usr/bin/systemctl enable sshd.service && /usr/bin/sudo /usr/bin/systemctl start sshd.service"
alias ssh-disable="/usr/bin/sudo /usr/bin/systemctl stop sshd.service && /usr/bin/sudo /usr/bin/systemctl disable sshd.service"

alias edit-vim-config="/usr/bin/sudo /usr/bin/$cli_editor /etc/vimrc"
alias vimsync="/usr/bin/cp /etc/vimrc ~/.vimrc"

# utility commands
alias add='/usr/bin/$aur_helper -S'
alias nay='/usr/bin/$aur_helper -R'
alias bye='/usr/bin/$aur_helper -Rns'
alias cln='/usr/bin/git clone'
alias upt='/usr/bin/$aur_helper -Syyu && omf update'
alias cle='/usr/bin/$aur_helper -Rsn (/usr/bin/$aur_helper -Qdtq)'
alias cuc='/usr/bin/$aur_helper -Scc && /usr/bin/$sudo_command /usr/bin/pacman -Scc'
alias swr='/usr/bin/$sudo_command /usr/bin/swapoff -a; /usr/bin/$sudo_command /usr/bin/swapon -a'
alias mrf='/usr/bin/$sudo_command /usr/bin/reflector --age 10 --latest 50 --sort rate --save /etc/pacman.d/mirrorlist && /usr/bin/$aur_helper -Syyu'
alias ers='/usr/bin/echo "" >'
alias esh='/usr/bin/echo "" > /home/$username/.ssh/known_hosts'
alias fld='/usr/bin/find / 2>/dev/null | /usr/bin/grep -i'

alias systype='/usr/bin/file /sbin/init'
alias back='cd ..'

# command remapping
alias ls="/usr/bin/lsd"
alias cat="/usr/bin/bat"

# custom comands (people might what to remove these)
alias glew='/usr/bin/python3.9 /home/$username/$username/coding/python_/glew/glew/__main__.py'

alias edit-fish-prompt-user='/usr/bin/$cli_editor /home/$username/.config/fish/functions/fish_prompt.fish'
alias edit-fish-prompt-root='/usr/bin/$sudo_command /usr/bin/$cli_editor /root/.config/fish/functions/fish_prompt.fish'

alias edit-i3-config='/usr/bin/$cli_editor /home/$username/.config/i3/config'
alias edit-i3blocks-config='/usr/bin/$cli_editor /home/$username/.config/i3blocks/i3blocks.conf'
alias edit-poly-config='/usr/bin/$cli_editor /home/$username/.config/polybar/config'

# functions
function c
	gcc $argv -o main
end
function cin
	gcc $argv -o main -lm
end

# tools (people might what to remove these)
alias etcher='/usr/bin/chmod +x $username/coding/tools_/etcher-flash/balenaEtcher.AppImage && /usr/bin/$sudo_command ~/$username/coding/tools_/etcher-flash/balenaEtcher.AppImage'
alias ngrok='/usr/bin/chmod +x /home/username/$username/coding/tools_/ngrok_/ngrok && /home/$username/$username/coding/tools_/ngrok_/ngrok'

# autorun (people might what to remove these)
/usr/bin/pfetch
