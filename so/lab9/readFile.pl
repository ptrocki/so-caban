open FILE, $ARGV[0] or die $!;
binmode FILE;
my ($buf, $data, $n);
while (($n = read FILE, $data, 4) != 0) {
  print "$n bytes read\n";
  $buf .= $data;
}
close(FILE);
