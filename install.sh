#!/bin/sh

if [ ! -d "~/.var/" ]
then
   mkdir ~/.var/
fi
 
if [ ! -d "~/.var/dotfile/" ]
then
   mkdir ~/.var/dotfile/
fi

cp -r ./* ~/.var/dotfile/

chmod a+x ~/.var/dotfile/home/.local/bin/*

~/.var/dotfile/home/.local/bin/ply
