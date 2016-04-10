#!/bin/bash
if [ "$#" != "2" ]; then
	echo 'Niewystarczająca ilość argumentów'
	exit 1
fi

if [ ! -d "$1" ]; then
	echo 'Brak katalogu.'
	exit 2
fi

if [ ! -h "$2" ]; then
	echo 'Brak dowiązania.'
	exit 2
fi

PLIK=$(readlink -f "$2")
for file in `ls $1`
do
	if [ -h $1/$file ]; then
	found=$(readlink -f "$1/$file")
		if [ $PLIK = $found ]; then
		echo $file 'jest identycznym dowiązaniem'
		fi
	fi
done
