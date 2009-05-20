#!/usr/bin/perl
use strict;
use warnings;
use Math::Prime::XS qw/sieve_primes/;
use Math::Combinatorics;

my @primes = sieve_primes(8e6);
my %primes = map { $_, 1 } @primes;

my $max = 0;
# can skip 8 and 9 because 36 and 45 are divisible by 3
for my $n (reverse 2..7) {
    my $comb = Math::Combinatorics->new(data => [1..$n]);
    while (my $perm = join '', $comb->next_permutation) {
        $max = $perm if $perm > $max && exists $primes{$perm};
    }
    last if $max;
}
print "$max\n";
