#!/usr/bin/perl
use strict;
use warnings;
use Math::Prime::XS qw/sieve_primes/;
use integer;

my @primes = sieve_primes(1e6);
my %primes = map { $_, 1 } @primes;

N: for my $n (2..100000) {
    my $oddn = $n * 2 - 1;
    next if exists $primes{$oddn};
    for my $m (1..sqrt($oddn)) {
        my $possible_prime = $oddn - 2 * $m**2;
        next N if $primes{$possible_prime};
    }
    print "$oddn\n";
    last;
}
