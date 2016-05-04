#!/usr/bin/perl -w

# awk i perl traktują regex dość szegolnie 
# '' oraz ""
# / / - wyrazenia regularne
# / / / - zastąpienie
# '' = q!  !
# Podwyrażenia = wyróżniamy fragmenty podwyrażenia
# () - podwyrażenia, odwołujemy się przez $1 do podwyrażenia a w awk \1


# Zadanie:
# W zadanym pliku zawierającym kod C usunąć komentarze i wyświetlić kod bez komentarzy typu //
# uproszczenie: nie ma komentarzy typu /* */ ale mogą być stringi z // np. "Edek // Ola"
use File::Find;
use Cwd 'abs_path';



if ($#ARGV != 0) {die ("Zla ilosc parametrow")};
if (! -f $ARGV[0]) {die ("Argument nie jest plikiem");}



my $filename = $ARGV[0];
if (open(my $fh, '<:encoding(UTF-8)', $filename)) 
{
	while (my $row = <$fh>) {
		$row =~ s/\/\/[^\n\r]*(\n\r)?//g;
		print "$row";
 	}
	
} else {
  warn "Could not open file '$filename' $!";
}
