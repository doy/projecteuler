#!/usr/bin/perl
use strict;
use warnings;

for my $h_idx (144..100000) {
    my $hex = $h_idx * (2 * $h_idx - 1);
    my $tri_test = -1/2 + sqrt(1 + 8 * $hex) / 2;
    next unless $tri_test == int($tri_test);
    my $pent_test = 1/6 + sqrt(1 + 24 * $hex) / 6;
    next unless $pent_test == int($pent_test);
    print "$tri_test $pent_test $h_idx $hex\n";
    last;
}
