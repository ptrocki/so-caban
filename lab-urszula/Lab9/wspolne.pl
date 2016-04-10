#!/usr/bin/perl

$file = $ARGV[0];
$word = $ARGV[1];
$counter = 0;

open(data, $file);
@text = <data>;

foreach $line (@text)
{
	@sentence = split(/[.?!]/,$line);
	print "\n$line\n";
	foreach(@sentence)
	{
		@words = split(' ', $_);
		foreach(@words)
		{
			if ($_ =~ /$word/i)
			{
				print "$_ = ";
				$new = ucfirst($word);
				print "$new\n";
				$counter = $counter+1;
			}
		}
	}
}

print "$sentence\n";
print "$counter\n";
