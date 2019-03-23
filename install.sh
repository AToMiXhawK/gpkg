#!/bin/bash

if ! which git > /dev/null; then
	echo "git not installed. Install it with your local package manager and try again!"
	exit
fi

DIR=~/gpkg

if [[ -d $DIR ]]
then
  	cd ~/gpkg
  	git pull
	cd ~/gpkg
	chmod a+x ~/gpkg/gpkg
	cd ~
  	exit
else
	cd ~
	git clone https://github.com/AToMiXhawk/gpkg ~/gpkg

	case $SHELL in
		"$(which bash)")
		echo -e "\nif [ -d \"$HOME/gpkg\" ] ; then\nPATH=\"$HOME/gpkg:$PATH\"\nfi" >> ~/.bashrc
		#source ~/.bashrc
		#echo "Please close and reopen your terminal if the command gpkg doesn't work"
		gnome-terminal
		exit 
		exit
	;;

		"$(which zsh)")
		echo -e "\nif [ -d \"$HOME/gpkg\" ] ; then\nPATH=\"$HOME/gpkg:$PATH\"\nfi" >> ~/.zshrc
		source ~/.zshrc
		echo "Please close and reopen your terminal if the command gpkg doesn't work"
	;;

	*)
		echo "$0 is not supported"
		echo "Please add the following to the config file of you terminal manually (eg. ~/.bashrc or ~/.zshrc)"
		echo -e "\nif [ -d \"$HOME/gpkg\" ] ; then\nPATH=\"$HOME/gpkg:$PATH\"\nfi"
		echo -e "\nand then close and reopen your terminal and check if the command gpkg works"
		echo "Contact @atomixhawk (telegram/github) for support"

	;;
	esac

	cd ~/gpkg
	chmod a+x ~/gpkg/gpkg
	cd ~
	exit
fi
