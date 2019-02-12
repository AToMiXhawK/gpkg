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
		source ~/.bashrc
	;;

		"$(which zsh)")
		echo -e "\nif [ -d \"$HOME/gpkg\" ] ; then\nPATH=\"$HOME/gpkg:$PATH\"\nfi" >> ~/.zshrc
		source ~/.zshrc
	;;

	*)
		echo "$0 is not supported"
	;;
	esac

	cd ~/gpkg
	chmod a+x ~/gpkg/gpkg
	cd ~
	exit
fi
