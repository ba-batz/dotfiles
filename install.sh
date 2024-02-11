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

exec ~/.var/dotfile/home/.local/bin/dotapply
exec ~/.var/dotfile/home/.local/bin/etc-dotapply
