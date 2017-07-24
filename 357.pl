#!/usr/bin/perl
use strict;
use warnings;
use 5.014;
use List::Util qw/all/;
use Math::Prime::XS qw/sieve_primes/;
use Math::Factor::XS qw/factors/;

say "calculating primes...";
my @primes = sieve_primes(1e8);
my %primes = map { $_, 1 } @primes;
say "done (found " . @primes . " primes)";

my $total = 0;

# handle 2 separately (1 + 1/1 = 2, which is prime)
shift @primes;
$total += 1;

for my $i (@primes) {
    my $n = $i - 1;
    # because here we assume odd primes
    next unless $primes{2 + $n / 2};

    my @factors = factors($n);
    @factors = @factors[0..(@factors / 2)] if @factors > 0;
    if (all { $primes{$_ + $n / $_} } @factors) {
        $total += $n;
    }
}

say $total;
