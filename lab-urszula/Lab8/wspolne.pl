#!/usr/bin/perl

my $i=0;
my $min=9999999999999;
my $max=0;
my $plikmin;
my $plikmax;
my $lkat=-1;

use File::Find;
find(\&function, $ARGV[0]);

sub function
{
	if (-f $_)
	{
		if ($max < -s $_)
		{
			$max = -s $_;
			$plikmax = $_;
		}
		if ($min > -s $_)
		{
			$min = -s $_;
			$plikmin = $_;
		}
	}
	else 
	{
		if (-d $_)
		{
			$lkat = $lkat+1;
		}
	}	
}

printf "\nNajmniejszy plik: $min";
printf "\nNajwiekszy plik: $max";
printf "\nLiczba podkatalogów: $lkat \n\n";
