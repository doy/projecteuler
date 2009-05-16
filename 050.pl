#!/usr/bin/perl
use strict;
use warnings;
use Math::Prime::XS qw/sieve_primes/;
use List::Util qw/sum/;

my @primes = sieve_primes(1e6);
my %primes = map { $_, 1 } @primes;

my $max = 0;
my $max_sum = 0;
LENGTH: for my $length (21..1000) {
    for my $start (0..(@primes - $length)) {
        my $sum = sum @primes[$start..($start + $length - 1)];
        next LENGTH if $sum > 1e6;
        next unless $primes{$sum};
        if ($length > $max) {
            $max = $length;
            $max_sum = $sum;
        }
    }
}
print "$max_sum\n";
