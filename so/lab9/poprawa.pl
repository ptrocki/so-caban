#!/usr/bin/perl -w

# Zadanie:
# W zadanym pliku zawierającym kod C usunąć komentarze i wyświetlić kod bez komentarzy typu //
# uproszczenie: nie ma komentarzy typu /* */ ale mogą być stringi z // np. "Edek // Ola"
use File::Find;

if ($#ARGV != 0) {die ("Zla ilosc parametrow")};
if (! -f $ARGV[0]) {die ("Argument nie jest plikiem");}


$/ = undef;  
$_ = <>;   

s!((["])(.)*?\2)|//[^\n]*!$1 | "" !eg;
print;

#
#w zadanym pliku tekstowym zastąpić znaku tabluacji przez własciwą liczbę spacji tak aby
# wygląd na ekranie sie nie zmienił zakłądając, że ekran ma linie tabulacji co n znaków
