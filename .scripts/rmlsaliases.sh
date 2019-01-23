#!/bin/bash

# removes all ls aliases from .bashrc

aliasls=$(`cat ~/.bashrc | grep -q 'alias ls'` ; echo "$?")
aliasla=$(`cat ~/.bashrc | grep -q 'alias la'` ; echo "$?")
aliasll=$(`cat ~/.bashrc | grep -q 'alias ll'` ; echo "$?")

if [ $aliasls == '0' ]; then
	echo -e "\n\n\tAlias for ls found in ~/.bashrc";
	sed -i '/alias ls/d' ~/.bashrc;
	echo -e "\n\tls alias removed from ~/.bashrc";
fi

if [ $aliasla == '0' ]; then
	echo -e "\n\n\tAlias for la found in ~/.bashrc";
	sed -i '/alias la/d' ~/.bashrc;
	echo -e "\n\tla alias removed from ~/.bashrc";
fi

if [ $aliasll == '0' ]; then
	echo -e "\n\n\tAlias for ll found in ~/.bashrc";
	sed -i '/alias ll/d' ~/.bashrc;
	echo -e "\n\tll alias removed from ~/.bashrc";
fi

unset aliasls aliasla aliasll;
