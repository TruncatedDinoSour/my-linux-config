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

# fish commands
alias edit-fish-aliases='/usr/bin/sudo /usr/bin/nano /etc/fish/config.fish'
alias show-fish-aliases='/usr/bin/cat /etc/fish/config.fish | /usr/bin/grep "^alias"'
alias show-fish-config='/usr/bin/cat /etc/fish/config.fish'

# long commands
alias nanosync-h2r='/usr/bin/sudo /usr/bin/cp ~/.nanorc /etc/nanorc'
alias nanosync-r2h='/usr/bin/cp /etc/nanorc ~/.nanorc'

alias grub-remake='/usr/bin/sudo /usr/bin/grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-config='/usr/bin/sudo /usr/bin/nano /etc/default/grub'
alias get-grub-config='/usr/bin/cat /etc/default/grub'

alias edit-graphics-config='/usr/bin/sudo /usr/bin/nano /etc/X11/xorg.conf.d/20-intel.conf'
alias get-hw-config='/usr/bin/cat /etc/X11/xorg.conf.d/20-intel.conf'
alias get-gdriver-info='/usr/bin/sudo /usr/bin/lspci -k | /usr/bin/grep -EA3 \'VGA|3D|Display\''
alias get-hw='/usr/bin/sudo /usr/bin/lspci'

alias edit-reflector-config='/usr/bin/sudo /usr/bin/nano /etc/xdg/reflector/reflector.conf'
alias show-reflector-config='/usr/bin/cat /etc/xdg/reflector/reflector.conf'

alias installed-pks='/usr/bin/yay -Q'
# utility commands
alias add='/usr/bin/yay -S'
alias nay='/usr/bin/yay -R'
alias bye='/usr/bin/yay -Rns'
alias cln='/usr/bin/git clone'
alias upt='/usr/bin/yay -Syyu && omf update'
alias cle='/usr/bin/yay -Rsn (/usr/bin/yay -Qdtq)'
alias cuc='/usr/bin/yay -Scc'

alias systype='/usr/bin/file /sbin/init'
alias back='cd ..'

# custom comands
alias glew='/usr/bin/python3.9 /home/ari/ari/coding/python_/glew/glew/__main__.py'

# functions
function c
	gcc $argv -o main
end
function cin
	gcc $argv -o main -lm
end

# tools
alias etcher='/usr/bin/chmod +x ari/coding/tools_/etcher-flash/balenaEtcher.AppImage && /usr/bin/sudo ~/ari/coding/tools_/etcher-flash/balenaEtcher.AppImage'
alias ngrok='/usr/bin/chmod +x ~/ari/coding/tools_/ngrok_/ngrok && ~/ari/coding/tools_/ngrok_/ngrok'

# autorun
/usr/bin/pfetch
