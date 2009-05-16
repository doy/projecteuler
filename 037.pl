#!/usr/bin/perl
use strict;
use warnings;
use Math::Prime::XS qw/sieve_primes/;
use List::MoreUtils qw/all/;

my @primes = sieve_primes(1e6);
my %primes = map { $_, 1 } @primes;
my $total = 0;
for my $prime (@primes) {
    next if $prime < 10;
    my @potentials = grep { length }
                     map { substr($prime, 0, $_),
                           substr($prime, $_)     }
                     1..(length $prime);
    next unless all { $primes{$_} } @potentials;
    $total += $prime;
}
print "$total\n";
