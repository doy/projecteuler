#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw/sum/;
use Math::Combinatorics qw/factorial/;

my @numbers;
for my $i (10..500000) {
    my @digits = split //, $i;
    my $sum = sum map { factorial($_) } @digits;
    push @numbers, $i if $i == $sum;
}
print join('+', @numbers), ' = ', sum(@numbers), "\n";
