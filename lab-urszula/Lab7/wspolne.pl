#!/usr/bin/perl

$file = @ARGV[0];

open (data, $file) or die "Nie ma takiego pliku.\n";

@text = <data>;

foreach $line (@text)
{
	@sentences = split(/[.?!]/, $line);
	foreach $sentence (@sentences)
	{
		if ($sentence =~ /\d\d\d/)
		{
			$sentence =~ s/^\s+//;
		}
		print "$sentence\n";
	}
}

