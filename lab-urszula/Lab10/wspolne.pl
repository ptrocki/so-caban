#!/usr/bin/perl

use File::Find;
use File::Copy;
use Cwd 'abs_path';

find(\&function, $ARGV[0]);

sub function 
{
	my $name = $File::Find::name;
	$name =~ s/$ARGV[0]/$ARGV[1]/gi;
	if (-d $_)
	{
		mkdir $name;
	}
}

find(\&function2, $ARGV[0]);

sub function2
{
	my $name = $File::Find::name;
	$name =~ s/$ARGV[0]/$ARGV[1]/gi;
	if (-f && ! -d && ! -l $_)
	{
		copy($File::Find::name, "$name");
	}
}
