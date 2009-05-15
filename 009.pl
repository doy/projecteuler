#!/usr/bin/perl
use strict;
use warnings;

A: for my $a (1..1000) {
    B: for my $b (1..(1000 - $a)) {
        my $c = 1000 - $a - $b;
        next A if $c <= 0;
        if ($a**2 + $b**2 == $c**2) {
            print "$a, $b, $c: ", $a * $b * $c, "\n";
            last A;
        }
    }
}
