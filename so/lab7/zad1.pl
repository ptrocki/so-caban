#!/usr/bin/perl -w

#Zadanie
# 4 metody wywolywania 
# Nie wywoływać funkcji systemowych w perlu 
# Context skalarny, listowy
# Zmienne: $skalar, @tablica, %mapa
# $ sieganie do zmiennej 
# a[1]

# Zadanie:
# w zadanym katalogu wylistować podkatalogi w których suma wielkości plików regurlanych po ustawionym atrybucie 
# write dla usera i wlasciciela lub innych jest wieksza niz 10 kB

# opendir, closedir, readdir
# wywolac szybko closedir  
# funckja start
# moduł stat ? 


use strict;
use warnings;
use autodie;

my $path = $ARGV[0];
die "Please specify directory in first parametr" 
    unless -d $path;

my @mySubDirs;
my $dirmode;
my $size
opendir( my $DIR, $path );
while ( my $entry = readdir $DIR ) {
	next unless -d $path . '/' . $entry;
    	next if $entry eq '.' or $entry eq '..';
	push(@mySubDirs,$entry);

	opendir(my $DIRR, "./$path/$entry") || die "can't opendir $entry: $!";
	my @dots = readdir($DIRR);
	foreach my $per (@dots) {
		if( -f  "./$path/$entry/$per"){
			 my $mode = (stat($dir))[2] & 0777;
        		if(($mode & 0111) != 0000)
        		{
            		if (($mode & 0222) = 0000)
            		{
             			 $size = $size + (stat($dir))[7]                    }
        		}	
		}	
	}
	closedir DIR;
}
foreach (@mySubDirs) {
  print "$size\n";
}
closedir $DIR;


// inne zadanie
#!/usr/bin/perl -w
use Fcntl ':mode';

$dir = $ARGV[0];

opendir(DIR, $dir) or die $!;

while (my $file = readdir(DIR))
{
next unless (-d "$dir/$file");
next if $file eq '.' or $file eq '..';
#print "$file\n";

$suma = 0;
opendir(DIR2, "$dir/$file");
while (my $file2 = readdir(DIR2))
{
if (-f "$dir/$file/$file2")
{
$size = (stat("$dir/$file/$file2"))[7];
$mode = (stat("$dir/$file/$file2"))[2];
$user_r = ($mode & S_IRUSR >> 6);
$group_r = ($mode & S_IRGRP >> 3);
$other_r = $mode & S_IROTH;
#print $user_r;
#print "$mode\n";
#print "$file2\n";
if ($user_r >= 4 or $group_r >= 4 or $other_r >= 4)
{
$suma = $suma + $size;
}
}
}
if ($suma > 10000)
{
print "$dir/$file\n";
}
closedir(DIR2);

}

closedir(DIR);
exit 0;
