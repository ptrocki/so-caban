#!/bin/bash

find $1 -type f | awk 'BEGIN { FS="[\n]"; x=0; name=""; }
{	
	split($NF,tab," ");
	if( tab[2]>x )
	{
		x=tab[2];
		name=tab[9];
	}
END { printf nazwa, "\n" }'

