#!/bin/bash
s=0
w=0
awk 'BEGIN { RS="[.?!]" }
NF>0 {for(i=1;i<=NF;i++){x+=length($i)}; w++; s+=x; print s/w; x=0} 
END {print s/w} ' $1
