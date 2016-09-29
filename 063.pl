#!/usr/bin/env perl
use strict;
use warnings;
use 5.014;

my $count = 0;
my $exp = 1;
while (1) {
    my $seen;
    for my $base (1..9) {
        if ($exp * (log($base) / log(10)) >= $exp - 1) {
            $count++;
            $seen = 1;
        }
    }
    last unless $seen;
    $exp++;
}

say $count;
