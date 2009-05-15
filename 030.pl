#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw/sum/;

my @numbers;
for my $i (10..500000) {
    my @digits = split //, $i;
    my $sum = sum map { $_**5 } @digits;
    push @numbers, $i if $i == $sum;
}
print join('+', @numbers), ' = ', sum(@numbers), "\n";
