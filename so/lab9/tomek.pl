#!/usr/bin/perl -w


if ($#ARGV != 0)
{
        print "Zla liczba argumentow!\n";
        exit;
}

if (! -f $ARGV[0])
{
        print "Argument nie jest plikiem!\n";
        exit;
}
open(PLIK,$ARGV[0]);
while($scalar = <PLIK>){
	if($scalar =~ /(\((.*)\))/){
		
		my @chars=split /\)/,$2;
		
		foreach my $line (@chars){ 	
			if($line =~ /(\(.*)/){
				print $1."\n";		
			}
		}
	}
}

