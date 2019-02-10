#!/bin/bash

echo -e "if [ -d "$HOME/gpkg" ] ; then
    PATH="$HOME/gpkg:$PATH"
fi" >> ~/.profile
source ~/.profile
