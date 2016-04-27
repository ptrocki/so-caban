

#!/usr/bin/perl -w
 
# File::Find::name -nazwa pliku wraz ze sciezka z komendy find
#
# Zadanie:
# w zadanym drzewie katalogow znalexc dowiazania symboliczne do katalogow zawierajacych pliki wykonywanlne
# tzn takie dla ktorych ustawiony jest bit x conajmniej dla wlasciciela lub grupy lub innych
 
 
 
if ($#ARGV != 0) {die ("Zla ilosc parametrow")};
if (! -d $ARGV[0]) {die ("Argument nie jest katalogiem");}
 
use File::Find;
use Cwd 'abs_path';
 
find(\&funkcja, $ARGV[0]);
 
sub funkcja {
 
if (-l $_)
{
 
my $zm = abs_path($_);
 
my @plik = split(/\//, $zm);
 
my $sciezka = $File::Find::name;
 
my @symlink = split(/\//, $sciezka);
 
opendir( my $DIR, $zm );
    while ( my $entry = readdir $DIR ) {
        my $fullDir = "$zm/$entry";
        $permmode = (stat($fullDir))[2];
        if(($permmode & 0100) or ( $permmode & 0010) or ( $permmode &0001)){
            if(-f $fullDir){
                print "$symlink[$#symlink] \n";
            }
        }      
       
    }
closedir $DIR;
}
}
