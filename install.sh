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
  	exit
else
	cd ~
	git clone https://github.com/AToMiXhawk/gpkg ~/gpkg
	echo -e "if [ -d "$HOME/gpkg" ] ; then
    PATH="$HOME/gpkg:$PATH"
	fi" >> ~/.profile

	source ~/.profile
fi



