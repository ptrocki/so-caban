#/!bin/bash
echo "znalezione katalogi zgodne z kryterium:"
find . -type d -perm -u+rw ! -perm -g+w  -printf "%p %m \n"

