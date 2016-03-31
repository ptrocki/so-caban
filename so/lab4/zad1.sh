#!/bin/bash
## w zadanym drzewie katalogow  znalezc dowiazania twarde do plikow reguralnych 
# i wylistowac w postaci sciezka pierwsza sciezka druga sciezka  sciezka 3....

if [ "$#" != 1 ]
then
	echo " Niepoprawna liczba parametrow";
	exit 1;
fi
var3=0
var4=0
var5=""
if [ -d "$1" ]
then
	echo "Rozpoczynam Szukanie";
find $1 -type f -links +1 -printf '%i %p\n' | sort | while read var1 var2
	do
	    if [ $var3 -eq $var1 ]; then
		var5="$var5 $var2";
		var4=$var4+1;
	    else
			if [ $var4>1 ]
			then
			echo $var5;
			fi
		var5="$var2";
		var4=0;
	    fi
	    var3=$var1;
	done
else 	
	echo "$1 nie jest katalogiem"
	exit 2
fi
