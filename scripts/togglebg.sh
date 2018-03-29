#!/bin/bash

TOGGLE=$HOME/.theme
CURRENT=`cat $TOGGLE`
if [ $CURRENT == "dark" ]
then
	osascript ~/dotfiles/scripts/changeColor.scpt "Solarized Light ansi"
	echo light > $TOGGLE
	echo "Switching from dark theme to light"

elif [ $CURRENT == "light" ]
then
	osascript ~/dotfiles/scripts/changeColor.scpt "Solarized Dark ansi"
	echo dark > $TOGGLE
	echo "Switching from light theme to dark"

else
	echo "ERROR: Theme variable not set correcly\nIt's set to $CURRENT and should be either 'light' or 'dark'"

fi

