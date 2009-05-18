#!/usr/bin/perl
use strict;
use warnings;

my $n = 1;
my $total = $n;
for my $i (1..500) {
    for my $j (1..4) {
        $n += 2 * $i;
        $total += $n;
    }
}
print "$total\n";
