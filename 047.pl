#!/usr/bin/perl
use strict;
use warnings;
use integer;
use Math::Prime::XS qw/sieve_primes/;
use List::MoreUtils qw/all uniq/;
use 5.010;

my @primes = sieve_primes(1e6);
my %primes = map { $_, 1 } @primes;
my %factors;

sub factors {
    my ($n_orig) = @_;
    my @ret;
    my $prime_idx = 0;
    my $n = $n_orig;
    while ($n > 1) {
        if (exists $factors{$n}) {
            push @ret, @{ $factors{$n} };
            last;
        }
        if (exists $primes{$n}) {
            push @ret, $n;
            last;
        }
        my $prime = $primes[$prime_idx];
        if (($n / $prime) * $prime == $n) {
            $n /= $prime;
            push @ret, $prime;
        }
        else {
            $prime_idx++;
        }
    }
    $factors{$n_orig} = \@ret;
    return @ret;
}

map { factors($_) } 1..1000000;

for my $n (0..999996) {
    if (all { $_ >= 4 } map { scalar uniq @$_ } @factors{$n..($n + 3)}) {
        print $n + 1, "\n";
        last;
    }
}
