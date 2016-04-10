#!/usr/bin/perl

$file = $ARGV[0];
$lenght = 0;
$counter = 0;
$max = 0;

open(data, $file);
@text = <data>;

foreach $line (@text)
{
	@sentence = split(/[.?!]/, $line);
	foreach $x (@sentence)
	{
		@word = split(/ /, $x);
		foreach $y (@word)
		{
			if ($max < length($y))
			{
				$max = length($y);
			}
		}
	}
}

open(data, $file);
@text = <data>;

for($i = 1; $i <=  $max; $i++)
{
	foreach $line (@text)
	{
		@sentence = split(/[.?!]/, $line);
		foreach $x (@sentence)
		{
			@word = split(/ /, $x);
			foreach $y (@word)
			{
				$w = length($y);
				if ($w == $lenght)
				{
					$counter = $counter + 1;
				}
			}
		}
	}
	print "Słowo $lenght znakowe występuje $counter razy\n";
	$lenght = $lenght+1;
	$counter = 0;
}
