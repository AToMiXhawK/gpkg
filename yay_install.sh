#!/bin/bash	

cyan='tput setaf 6'
yellow='tput setaf 3'
reset='tput sgr0'

# install yay

release=$(head /etc/os-release -n 1 | cut -d '"' -f 2)

case $release in 
	"Arch Linux"|"Antergos Linux"|"Manjaro Linux")

	if ! which yay > /dev/null; then
      			sudo pacman -S git --noconfirm
			git clone https://aur.archlinux.org/yay.git yay
			cd yay
			makepkg -si --noconfirm					   	
	else
		echo -e "yay already installed!"
	fi
	;;

	*)
		echo -e "\n$($cyan)// woops. you're probably not running an $($yellow)Arch $($cyan)based distro$($reset)\n"
	;;

esac
echo -e "\n$($cyan)// yay installed!!."
