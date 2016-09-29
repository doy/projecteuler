#!/usr/bin/env perl
use strict;
use warnings;
use 5.014;

use Math::Prime::XS qw(is_prime);

my $incr = 0;
my $val = 1;
my $total = 1;
my $primes = 0;

while (1) {
    $incr += 2;

    for (1..4) {
        $val += $incr;
        $total++;
        $primes++ if is_prime($val);
    }

    if ($total / $primes > 10) {
        say $incr + 1;
        exit;
    }
}
