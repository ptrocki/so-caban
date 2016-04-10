#/!bin/bash

echo "to są trzy największe pliki:"
find -type f -printf "%f %s \n"| sort -n -k 2| tail -n 3 

echo "to są trzy najmniejsze pliki:"
find -type f -printf "%f %s \n"| sort -n -k 2| head -n 3
