#!/bin/bash
for file1 in $1/*
do
	for file2 in $1/*
	do
		if [ ! -h  $file1 ]
		then
			if [ -h $file2 ]
			then
				root1=$(readlink -f "$file1")
				root2=$(readlink -f "$file2")
				if [ "$root1" = "$root2" ]
				then
					echo $file1 "jest plikiem posiadającym dowiązanie" $file2 " w tym katalogu"
				fi
			fi
		fi
	done
done
