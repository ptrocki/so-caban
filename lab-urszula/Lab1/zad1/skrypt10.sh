#!/bin/bash
if [ $# -ne 2 ]
then
	echo "Wprowadź dwa katalogi!"
	echo "$0 katalog1 katalog2"
	exit1
fi

if [[ ! -d $1 ]]; then 
	echo "$1 to nie katalog."
	exit1
fi

if [[ ! -d $2 ]]; then
	echo "$2 to nie katalog."
	exit1
fi

LIST1=`ls $1`
LIST2=`ls $2`

for file1 in $LIST1
do
	for file2 in $LIST2
	do
		if [[ ! -d $1/$file1 ]] && [[ ! -d $2/$file2 ]]
		then
			diff $1/$file1 $2/$file2 > /dev/null
			if [[ $? -eq 0 ]] && [[ $file1 = $file2 ]]
			then
				echo "Plik $file1 jest identyczny w obu katalogach."
			fi
		fi
	done
done
 
