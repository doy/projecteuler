#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use List::Util qw/reduce/;

my %triples;

A: for my $a (1..1000) {
    for my $b (1..1000) {
        my $c = sqrt($a**2 + $b**2);
        next A if $a + $b + $c > 1000;
        next if $c != int($c);
        $triples{$a + $b + $c}++;
    }
}
our ($a, $b);
say reduce { $triples{$a} > $triples{$b} ? $a : $b } keys %triples;
