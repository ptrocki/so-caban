#!/usr/bin/perl -w
 
$/ = undef;   # no line delimiter
$_ = <>;   # read entire file
;
s!((['"])(?:\\.|.)*?\2)|//[^\n]*!$1 || "" !eg;
print;

#http://tech.techcollections.info/2011/05/perl-script-to-remove-comments-from-c.html
