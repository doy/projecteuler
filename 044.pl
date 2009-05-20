#!/usr/bin/perl
use strict;
use warnings;
use integer;

my %p;

for my $n (1..10000) {
    $p{$n} = $n * (3 * $n - 1) / 2;
}
my %rp = reverse %p;

my $min = 1e9;
N: for my $n (1..10000) {
    for my $m ($n..10000) {
        my $sum = $p{$m} + $p{$n};
        my $diff = $p{$m} - $p{$n};
        next N if $diff > $min;
        if (exists $rp{$sum} && exists $rp{$diff}) {
            $min = $diff if $diff < $min;
        }
    }
}
print "$min\n";
