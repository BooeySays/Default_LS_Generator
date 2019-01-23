#!/bin/bash

DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

# DIALOG GOES BELOW
$DIALOG --clear --title "BACKUP .bashrc ?" --yesno "\nYou are about to modify your ~/.bashrc file and remove all the aliases for ls that the file comes with. As always, anytime you make any changes to a file, you should always make a backup of it... Just in case...\n\nWould you like to create a backup of your ~/.bashrc ?\n" 0 0 2> $tempfile;

retval=$?

case $retval in
0)
### BEGINNING - COMMAND LAUNCHED WHEN OK IS CLICKED ##### ###
# ________________________________________________________  #
#															#
# NOTE: Add command anywhere to be executed when OK is is	#
#		clicked anywhere between this box, and the one -	#
#		below this one										#
# ________________________________________________________  #
#															#
################ ⬇⬇⬇ ADD CODE BELOW HERE ⬇⬇⬇ ################
if [ $BOOEYSBACKUPS ]; then
	cp ~/.bashrc $BOOEYSBACKUPS/bashrc.bak;
	dialog --clear --title "Backup Created" --msgbox "Your ~/.bashrc has been backed up to $BOOEYSBACKUPS/bashrc.bak\n\nClick OK to continue and remove all ls alises from ~/.bashrc\n" 0 0;
	. $configls/.scripts/rmlsaliases.sh;
fi

############### ⬆⬆⬆ KEEP CODE ABOVE HERE ⬆⬆⬆ ################
# ________________________________________________________  #
#															#
# EXAMPLE:													#
# ________________________________________________________  #
#															#
### END - THE COMMAND THAT IS EXECUTED WHEN OK IS CLICKED ###
	;;
1)
	. $configls/.scripts/rmlsaliases.sh
	;;
255)
	if test -s $tempfile; then
		cat $tempfile
	else
		echo "ESC pressed."
	fi
	;;
esac

	
