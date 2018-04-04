#!/bin/bash

THEME=$HOME/.theme
CURRENT=`cat $THEME`

if [ $CURRENT == "light" ]
then
	osascript ~/dot-files/scripts/changeColor.scpt "Solarized Light ansi"
elif [ $CURRENT == "dark" ]
then
	osascript ~/dot-files/scripts/changeColor.scpt "Solarized Dark ansi"
else
	echo "ERROR cant sync theme"
fi
