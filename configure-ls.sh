#!/bin/bash

__version__=1.2
if [ $configls ]; then
	unset configls;
fi
configls=$PWD
DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

# DIALOG GOES BELOW
$DIALOG --clear --no-tags --title "LS CONFIGURE - MAIN MENU:" --menu "\nSelect an option\n" 0 0 0 "backupbashrc.sh" "1 - Remove all ls aliases from your system's ~/.bashrc file" \
	"ls_setup.sh" "2 - Configure ls with its new default options" \
	"create_new_alias" "3 - Create another ls alias and configure its default options" \
	"resetnewls.sh" "4 - Reset ls and remove all the default options" \
	"help.sh" "5 - Help" \
	"about.sh" "6 - About" 2> $tempfile;

retval=$?
case $retval in
0)
	. ./.scripts/`cat $tempfile`
	;;
1)
	echo "Cancel pressed."
	;;
255)
	echo "ESC pressed."
	;;
esac
unset __version__ configls;
