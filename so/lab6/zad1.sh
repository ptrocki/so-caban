#!/bin/bash

# Wzorce plikow != wyrazenia regularne
# Nie wszytskie wyr reg sa takie same. Wszystko zaczelo sie od grepa
# Pozniej pojawila sie norma POSIX. 
# Wyraznie maja podwyrazenia. Kawalki wzorca umieszczamy w nawiasie
# [a-z] np s z kresna nie zalezy do tego
# uzywac klasy [:klasy:] np [:digit:] - pulapka - np dla dowolnej cyfry [[:digit:]]+

# Zadanie
# w zadanym pliku tekstowym wyszukac odwolania do wzorów w postaci (liczba) i wyswietlic w postaci (numer wzoru): # numer wiesza, numer wiersza 

# W zadanym pliku tekstowym 
   

if [ $# -ne 1 ]
then
        echo "Niepoprawna liczba argumentów \n"
        exit 1
fi

if [ -f $1 ]
then 
awk 'BEGIN {tab[1]=""; tabl[1]=""}
{
for (i=1; i<=NF; i++)
{
    if($i ~ /^\([[:digit:]]+\)/)
    {		
    split($i, substring, /[,.;:?!]/);
    tab[substring[1]]=sprintf("%s %s", tab[substring[1]], NR);
    }
}
}
END {for (x in tab)
{
printf ("%s: %s\n", x, tab[x])
}
}' $1

else
       echo "$1 nie jest katalogiem"
       exit 1
fi
