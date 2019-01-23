#!/bin/bash

DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

# DIALOG GOES BELOW
$DIALOG --clear --title "About" --textbox "./about" 0 0;

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

echo 0;

############### ⬆⬆⬆ KEEP CODE ABOVE HERE ⬆⬆⬆ ################
# ________________________________________________________  #
#															#
# EXAMPLE:													#
# ________________________________________________________  #
#															#
### END - THE COMMAND THAT IS EXECUTED WHEN OK IS CLICKED ###
	;;
1)
	echo "Cancel pressed."
	;;
255)
	if test -s $tempfile; then
		cat $tempfile
	else
		echo "ESC pressed."
	fi
	;;
esac

	
