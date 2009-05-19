#!/usr/bin/perl
use strict;
use warnings;

my $max = 0;
for my $n (2..9) {
    for my $val (1..99999) {
        my $pandigital = join '', map { $val * $_ } 1..$n;
        next if length($pandigital) != 9;
        next if join('', sort split //, $pandigital) ne '123456789';
        $max = $pandigital if $pandigital > $max;
    }
}
print "$max\n";
