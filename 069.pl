#!/usr/bin/perl
use strict;
use warnings;
use Math::Prime::XS qw/sieve_primes/;

my @primes = sieve_primes(1e4);

my $prod = 1;
for my $prime (@primes) {
    $prod *= $prime;
    if ($prod > 1e6) {
        $prod /= $prime;
        last;
    }
}
print "$prod\n";
