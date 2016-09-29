#!/usr/bin/env perl
use strict;
use warnings;
use 5.014;

use bigint;

my $count = 0;
for my $i (1..9999) {
    $count++ if lychrel(Math::BigInt->new($i));
}

say $count;

sub lychrel {
    my ($i) = @_;

    for my $iter (1..50) {
        $i += reverse($i);
        return if $i == reverse($i);
    }
    return 1;
}
