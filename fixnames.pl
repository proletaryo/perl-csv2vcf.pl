use strict;
use warnings;

# 1.5 Gonzales 1G
# 1.5 G1Gonzales
while (<>) {
  $_ =~ tr/\r\n//d;
  if ($_ =~ /^(\d+\..*\d+)\s+(.+)\s(\d+(G|S))$/) {
    my $N1 = $1;
    my $N2 = $2;
    my $N3 = $3;

    $N3 = reverse $N3;

    print "${N1} ${N3}${N2}\n";
  }
  else {
    print "$_\n";
  }
}
