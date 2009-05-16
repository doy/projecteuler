#!/usr/bin/perl
use strict;
use warnings;
use Math::Prime::XS qw/sieve_primes is_prime/;

my @possibilities = sieve_primes(1000,9999);
my %primes = map { $_, 1 } @possibilities;

PRIME: for my $prime (@possibilities) {
    for my $inc (2..4500) {
        my ($prime2, $prime3) = ($prime + $inc, $prime + $inc + $inc);
        next PRIME if $prime3 > 9999;
        next unless $primes{$prime2} && $primes{$prime3};
        my @sort = map { join '', sort split //, $_ } $prime, $prime2, $prime3;
        if ($sort[0] eq $sort[1] && $sort[0] eq $sort[2]) {
            print "$prime$prime2$prime3\n";
        }
    }
}
