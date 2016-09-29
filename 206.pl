#!/usr/bin/env perl
use strict;
use warnings;
use 5.014;

use bigint;

for my $first (0..9) {
    for my $second (0..9) {
        my $min = 1020304050607080900 + $first * 100000000000000000 + $second * 1000000000000000;
        my $max = 1020394959697989990 + $first * 100000000000000000 + $second * 1000000000000000;
        my $guess = 10 + 10 * int(sqrt($min) / 10);

        while (1) {
            my $square = $guess**2;
            say $guess and exit if $square =~ /^1.2.3.4.5.6.7.8.9.0$/;
            $guess += 10;
            last if $square > $max;
        }
    }
}
