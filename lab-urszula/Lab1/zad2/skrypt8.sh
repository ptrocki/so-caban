#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Podaj tylko jeden katalog!"
	exit 1
fi

if [ ! -d $1 ]
then
	echo "$1 to nie katalog!"
	exit1
fi

function show_kat
{
	ZAW=$(ls $1)
	for file in $ZAW
	do
		if [ -d $1/$file ]
		then
			echo "$1/!file"
			show_kat $1/$file
		fi
		else
			echo "$1/$file"
		fi

	done
}

show_kat $1


