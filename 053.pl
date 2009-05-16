#!/usr/bin/perl
use strict;
use warnings;
use Math::Combinatorics;

my $count = 0;
for my $n (1..100) {
    for my $r (0..$n) {
        my $num = factorial($n)/(factorial($r) * factorial($n - $r));
        $count++ if $num > 1e6;
    }
}
print "$count\n";
