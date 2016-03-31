#!/bin/bash

#Dla 2 katalogow znaleźć dowiązania symboliczne w 1 folderze wskazujacy na 
#pliki regularne w drugim 

#readlink -f
#dirname - usuwa ostatni człon ze ścieżki
#basename - usuwa wszytsko przed ostatnim członem ścieżki

# pierwszy katalog - link 
# drugi katalog - plik 

if [ $# -ne 2 ]
then
        echo "Niepoprawna liczba argumentów. Proszę podać dwa argumenty"
        exit 1
fi


if [ -d $1 ]
then
    if [ -d $2 ]
    then
        for file in `ls $1`
        do
        if [ -h $1/$file ] 
            then
            dow1="`readlink -f $1/$file`"
            dow2="`readlink -f $2`/"
            if [ "${dow1#*$dow2}" != "$dow1" ] 
            then
            echo "plik $1/$file jest to dowiazaniem do pliku w katalogu $2" 
            fi
          
        fi
    done
else
    echo "$2 nie jest katalogiem"
        exit 1
    fi    

else
        echo "$1 nie jest katalogiem"
        exit 1
fi



