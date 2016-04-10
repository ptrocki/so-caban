#!/usr/bin/perl

$file = @ARGV[0];
$x = @ARGV[1];

open (data, $file) or die "Nie ma takiego pliku.\n";

@text = <data>;

foreach $line (@text)
{
        @sentences = split(/[.]/, $line);
        foreach $sentence (@sentences)
        {
                if ($sentence =~ /\d{$x,}?/)
                {
			if ($sentence =~ /4/ || $sentence =~ /2/)
			{
				print  "$sentence\n";
			}  
                }
        }
}

