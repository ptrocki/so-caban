#!/bin/bash
echo "Pliki z katalogu pierwszego: "
find $1 2>/dev/null  -type f | sort -n | while read first
do
	n=$(basename $first)
	s=$(stat -c%G "$first")
	if [ -z $(find $2 2>/dev/null -type f -name $n) ]
	then
		echo $first $s $n
	fi
done

echo "Pliki z katalogu drugiego: "
find $2 2>/dev/null -type f | sort -n | while read second
do
	n=$(basename $second)
	s=$(stat -c%G "$second")
	if [ -z $(find $1 2>/dev/null -type f -name $n) ]
	then
		echo $second $s $n
	fi
done
