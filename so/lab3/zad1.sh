#!/bin/bash

# w zadanym drzewie katalogow znalesc pliki regularne
# zmodyfikowane od 1 minuty do 3 minut wstecz
# do których wlasciciel na prawo wykonania a grupa lub inni nie maja 
#prawa zapisu ani odczytu 

if [ $# -ne 1 ]
then
        echo "Niepoprawna liczba argumentów. Proszę podać jeden argument"
        exit 1
fi


if [ -d $1 ]
then
   find $1 -type f \(-mmin -3 -a -mmin +1\) -perm /-u+x ! -perm /-o+wr,g+wr -print

else
    echo "$1 nie jest katalogiem"
    exit 1
fi



