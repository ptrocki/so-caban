#!/bin/bash

echo "Pliki z tą samą zawartością: "

find $1 2>/dev/null -type f | while read file
do
	f=$(basename $file)
	if [ -e $(find $2 -type f -name $filex) ]
	then
		cmp -s "$file" "$2/$filex"
		if [ $? -eq 0 ]
		then
			echo $file
			stat -c%y "$file"
		fi
	fi
done
