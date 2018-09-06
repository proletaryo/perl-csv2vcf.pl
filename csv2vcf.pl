use strict;
use warnings;

# from:
# 1.2 FooBar 1G,09123456789
#
# to:
# BEGIN:VCARD
# VERSION:3.0
# FN:1.2 FooBar 1G
# N:1G;1.;2 FooBar;;
# TEL;TYPE=CELL:09123456789
# END:VCARD
#
# BEGIN:VCARD
# VERSION:2.1
# N;ENCODING=QUOTED-PRINTABLE;CHARSET=UTF-8:;=
# 6.23=20FooBar=201G;;;
# TEL;VOICE;CELL:09123456789
# END:VCARD
#


while(<>) {
  # chomp($_);
  $_ =~ tr/\r\n//d;

  if (my ($FullName, $mobile) = split(/,/, $_, 2) ) {
    # # v3.1
    # if ($FullName =~ /^(\d+\.)(\d+\s+.+)\s(\d+(G|S))$/) {
    #   my $N1 = $3;
    #   my $N2 = $1;
    #   my $N3 = $2;

    #   print "BEGIN:VCARD\n";
    #   print "VERSION:3.0\n";
    #   print "FN:$FullName\n";
    #   print "N:${N1};${N2};${N3};;\n";
    #   print "TEL;TYPE=CELL:$mobile\n";
    #   print "END:VCARD\n";
    # }
    $FullName =~ s/\s/=20/g;

    print "BEGIN:VCARD\n";
    print "VERSION:2.1\n";
    print "N;ENCODING=QUOTED-PRINTABLE;CHARSET=UTF-8:;=\n";
    print "${FullName};;;\n";
    print "TEL;VOICE;CELL:${mobile}\n";
    print "END:VCARD\n";
    print "\n";
  }
}
