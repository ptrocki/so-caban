#!/bin/bash

# Zadanie 4
#   Numerowanie wszystkich plików w zadanym katalogu (parametr wywołania skryptu), do 
#   których mamy ustawione prawo wykonywania
#   („execute”), przez dodanie dodatkowego członu rozszerzenia o postaci .<numer kolejny>. 
#   Numeracja powinna przebiegać według wielkości plików. 

if [ $# -ne 1 ]
then
        echo "Niepoprawna liczba argumentów. Proszę podać jeden argument"
        exit 1
fi

if [ -d $1 ]
then
    cd $1
    licznik=1
        lista=`ls -S -r`
        for plik in $lista
        do
                if [ -x $plik ]
                then
                     mv $plik $plik.$licznik
                      licznik=$(($licznik+1))
                fi
        done

else
        echo "$1 nie jest katalogiem"
        exit 1
fi
