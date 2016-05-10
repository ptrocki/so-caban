$string = "The food is in the salad bar";
$string =~ m/foo/;
print "Before: $`\n";
print "Matched: $&\n";
print "After: $'\n";

This code prints the following when executed:
Before: The
Matched: foo
After: d is in the salad bar
