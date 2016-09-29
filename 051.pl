#!/usr/bin/env perl
use strict;
use warnings;
use 5.014;

use List::Util qw/all max/;
use Math::Combinatorics;
use Math::Prime::XS qw/primes/;

my %primes = map { $_ => 1 } primes(1e6);
my %patterns;

for my $prime (keys %primes) {
    $patterns{$_}++ for patterns($prime);
}

for my $pattern (keys %patterns) {
    say "$pattern: $patterns{$pattern}" if $patterns{$pattern} >= 7;
}

sub patterns {
    my ($prime) = @_;

    my @ret;
    for my $len (1..length($prime)) {
        for my $indices (combine($len, 0..(length($prime)-1))) {
            push @ret, make_pattern($prime, $indices);
        }
    }
    @ret;
}

sub make_pattern {
    my ($prime, $indices) = @_;

    return unless all {
        substr($prime, $_, 1) eq substr($prime, $indices->[0], 1)
    } @$indices;

    substr($prime, $_, 1) = 'x' for @$indices;
    return $prime;
}
