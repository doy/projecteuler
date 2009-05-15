#!/usr/bin/perl
use strict;
use warnings;

my $total = 0;
for my $n (1..1e6) {
    my $n2 = sprintf "%b", $n;
    $total += $n if $n eq reverse($n) and $n2 eq reverse($n2);
}
print "$total\n";
