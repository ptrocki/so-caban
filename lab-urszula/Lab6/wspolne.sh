!#/bin/bash
find $1 -type f | awk 'BEGIN{FS="[/]"; len=0; check=1;}
{
	len=split($NF,tab,"");
	for (i in tab)
		if ( tab[i] != tab[len-i+1] )
			check = 0;
		if (check == 1)
			print $0;
		check = 1;
}'

