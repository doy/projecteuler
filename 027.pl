#!/usr/bin/perl
use strict;
use warnings;
use Math::Prime::XS qw/sieve_primes/;

my @primes = sieve_primes(1e6);
my %primes = map { $_, 1 } @primes;

sub is_prime {
    my ($n) = @_;
    if ($n <= 1e6) {
        return exists $primes{$n};
    }
    return Math::Prime::XS::is_prime($n);
}

my $max = 0;
my $max_a = 0;
my $max_b = 0;
for my $a (-1000..1000) {
    for my $b (-1000..1000) {
        for my $n (0..1e6) {
            if (!is_prime($n**2+$a*$n+$b)) {
                if ($n - 1 > $max) {
                    $max = $n - 1;
                    $max_a = $a;
                    $max_b = $b;
                }
                last;
            }
        }
    }
}
print "$max $max_a $max_b ", $max_a * $max_b, "\n";
