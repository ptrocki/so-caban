#!/usr/bin/perl -w
 
$/ = undef;  
$_ = <>;
;
s!((['"])(?:\\.|.)*?\2)|//[^\n]*!$1 || "" !eg;
print;
