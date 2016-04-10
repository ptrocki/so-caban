#!/usr/bin/perl -w

use File::Find;
use Cwd;
find(\&REMOVE, $ARGV[0]); 
my $max = 0;

sub REMOVE 
{
	if (-w -r cwd()) 
	{
		($max) = (stat ($_) )[7];
		if(-f $_ and ($max) > $ARGV[1])
		 {
			unlink  $_;
		 }
	}
}
