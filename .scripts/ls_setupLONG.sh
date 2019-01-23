#!/bin/bash

DIALOG=${DIALOG=dialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

# DIALOG GOES BELOW
$DIALOG --clear --title 'LS setup:' --buildlist '\nTo enable an option, highlight any one of the listed options in the left window and add it to the ENABLED options \
list (right window). When you hit the SET button, a new alias for ls will be create  with all the options in the right window enabled by default.\n\nTo remove an \
option from the ENABLED list, just highlight the option you want to remove, and hit [SPACE] to move it back over to the left window.' 0 0 0 '-a' 'a) Do not ignore \
entries starting with.' 'off' \
  '-A' 'A) Do not list implied . and ..' 'off' \
  '-b' 'b) Print C-style escapes for nongraphic characters.' 'off' \
  '-B' 'B) Do not list implied entries ending with ~' 'off' \
  '-c' 'c) With -lt, sort by last modified. With -l, shows modified info, but sorts by name.' 'off' \
  '-C' 'C) List entries by columns' 'off' \
  '-d' 'd) list directories themselves, not their contents' 'off' \
  '-D' 'D) Generate output designed for Emacs\' dired mode' 'off' \
  '-f' 'f) Do not sort, enable -aU, disable -ls --color' 'off' \
  '-F' 'F) Append indicator (one of */=>@|) to entries' 'off' \
  '-g' 'g) Like -l, but do not list owner' 'off' \
  '-G' 'G) In a long listing, don\'t print group names' 'off' \
  '-h' 'h) With -l and -s, print sizes like 1K 234M 2G etc.' 'off' \
  '-i' 'i) Print the index number of each file' 'off' \
  '-I' 'I) Do not list implied entries matching shell PATTERN' 'off' \
  '-k' 'k) default to 1024-byte blocks for disk usage. Used only with -s and per directory totals' 'off' \
  '-l' 'l) Use a long listing format' 'off' \
  '-L' 'L) When showing file information for a symbolic link, show information for the file the link references rather than for the link itself' 'off' \
  '-m' 'm) Fill width with a comma separated list of entries' 'off' \
  '-n' 'n) Like -l, but list numeric user and group IDs' 'off' \
  '-N' 'N) Print entry names without quoting' 'off' \
  '-o' 'o) Like -l, but do not list group information' 'off' \
  '-q' 'q) Print ? instead of nongraphic characters' 'off' \
  '-r' 'r) Rreverse order while sorting' 'off' \
  '-s' 's) Print the allocated size of each file, in blocks' 'off' \
  '-t' 't) Sort by modification time, newest first' 'off' \
  '-u' 'u) With -lt, sort by access time. With -l, displayed, but sorted by name' 'off' \
  '-v' 'v) Natural sort of (version) numbers within text' 'off' \
  '-w' 'w) Set output width to COLS.  0 means no limit' 'off' \
  '-x' 'x) List entries by lines instead of by columns' 'off'  2> $tempfile;
	

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

