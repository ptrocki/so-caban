#!/usr/bin/perl -w

#laboratorium 8 - perl, operacje na drzewach katalogÛw
#W zad. drzewie kat. znaleüÊ dow. symb. do plikÛw regularnych o nazwie takiej jak to dowiπzanie

if ($#ARGV != 0) {die ("Zla ilosc parametrow")};
if (! -d $ARGV[0]) {die ("Argument nie jest katalogiem");}

use File::Find;
use Cwd 'abs_path';

$zm = 0;

find(\&funkcja, $ARGV[0]);

print "\n\n$zm";

sub funkcja {

if (-l $_)
{
$zm = abs_path($_);
@plik = split(/\//, $zm);

$sciezka = $File::Find::name;
@symlink = split(/\//, $sciezka);
    if ($plik[$#plik] eq $symlink[$#symlink])
    {
    print "Plik: $zm\nDowiazanie: $sciezka\n";
    }
}
}
