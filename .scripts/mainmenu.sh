#!/bin/bash

DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

# DIALOG GOES BELOW
$DIALOG --clear --no-tags --title "LS CONFIGURE - MAIN MENU:" --menu "\nSelect an option\n" 0 0 0 "rmlsaliases.sh" "1 - Prep System - Remove all ls aliases from your shell's rc file" \
	"ls_setup.sh" "2 - Configure ls with its new default options" \
	"create_new_alias" "3 - Create another ls alias and configure its default options" \
	"resetnewls.sh" "4 - Reset ls and remove all the default options" \
	"help.sh" "5 - Help" \
	"about.sh" "6 - About" 2> $tempfile;

retval=$?
case $retval in
0)
	. ./`cat $tempfile`
	;;
1)
	echo "Cancel pressed."
	;;
255)
	echo "ESC pressed."
	;;
esac
