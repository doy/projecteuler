#!/usr/bin/perl
use strict;
use warnings;

my $lower = 428571 / 1e6;
my $upper = 3 / 7;
my $lower_numer = 0;
for my $denom (1..1e6) {
    my $closest = int($denom * 3 / 7);
    my $closest_frac = $closest / $denom;
    if ($closest_frac > $lower && $closest_frac < $upper) {
        $lower = $closest_frac;
        $lower_numer = $closest;
    }
}
print "$lower_numer\n";
