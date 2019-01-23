#!/bin/bash

DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

# DIALOG GOES BELOW
$DIALOG --clear --title 'LS setup:' --buildlist '\nTo enable an option, highlight any one of the listed options in the left window and add it to the ENABLED options list (right window). When you hit the SET button, a new alias for ls will be create  with all the options in the right window enabled by default.\n\nTo remove an option from the ENABLED list, just highlight the option you want to remove, and hit [SPACE] to move it back over to the left window.' 0 0 0 '-a' 'a) Do not ignore entries starting with.' 'off' \
  '-A' 'A) Do not list implied . and ..' 'off' \
  '-c' 'c) With -lt, sort by last modified. With -l, shows modified info, but sorts by name.' 'off' \
  '-C' 'C) List entries by columns' 'off' \
  '-d' 'd) list directories themselves, not their contents' 'off' \
  '-F' 'F) Append indicator (one of */=>@|) to entries' 'off' \
  '-g' 'g) Like -l, but do not list owner' 'off' \
  '-G' 'G) In a long listing, don\'t print group names' 'off' \
  '-h' 'h) With -l and -s, print sizes like 1K 234M 2G etc.' 'off' \
  '-k' 'k) default to 1024-byte blocks for disk usage. Used only with -s and per directory totals' 'off' \
  '-l' 'l) Use a long listing format' 'off' \
  '-m' 'm) Fill width with a comma separated list of entries' 'off' \
  '-N' 'N) Print entry names without quoting' 'off' \
  '-q' 'q) Print ? instead of nongraphic characters' 'off' \
  '-r' 'r) Rreverse order while sorting' 'off' \
  '-t' 't) Sort by modification time, newest first' 'off' \
  '-u' 'u) With -lt, sort by access time. With -l, displayed, but sorted by name' 'off' \
  '-v' 'v) Natural sort of (version) numbers within text' 'off' \
  '-x' 'x) List entries by lines instead of by columns' 'off' \ 
  '--group-directories-first' '1) Group directories before files' 'off' \
  '--color=always' '2) Always colorize output' 'off' \
  '--color=never' '3) Disable coloried output' 'off' \
  '--color=auto' '4) Set colorised output to auto' 'off' 2> $tempfile;


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

alias testls='ls `cat $tempfile`'
echo -e '''
# DEFAULTLS #
alias ls='ls `cat $tempfile`'
# /DEFAULTLS #
''' >> $ALIASES66
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
	echo "ESC pressed."
	;;
esac
