#!/bin/bash

#awk nie jest sekwencyjne 
# selektor {akcja}
# jeśli selektor to akcja 
# BEGIN END to są selektory
# Zmienne AWK'a : RS=rekord sepatart FS=field separator NF = number of fields
# $i to jest ite pole bierzacego rekordu 

# Zadanie
# W zadanym drzewie katalogow znalexc pliki regularne o tej samej nazwie powtarzajacej sie i wydrukowac   
# polozenie plikow
#   
#   

if [ $# -ne 1 ]
then
        echo "Niepoprawna liczba argumentów \n"
        exit 1
fi
if [ -d $1 ]
then 

find $1 -type f -printf "%f %p\n" | sort | awk '
BEGIN {
    licznik = 0
    temp= ""
    wyj= ""
}
 
{
    if( temp != $1 ){
	 if( licznik > 0){
            print wyj      
    	}
   	 licznik = 0
   	wyj = "Plik " $1 " znajduje sie w katalogach " $2 
    }else {
       	wyj = wyj " oraz " $2        
	licznik = licznik +1  
    }

    temp = $1
}
 
END {
    if( licznik > 0){
        print wyj      
    }
}
'
else
       echo "$1 nie jest katalogiem"
       exit 1
fi
