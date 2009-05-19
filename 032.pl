#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use List::Util qw/sum/;

my %found;

A: for my $a (1..99) {
    B: for my $b ($a..9999) {
        my $prod = $a * $b;
        my $length = length($prod) + length($a) + length($b);
        next B if $length < 9;
        next A if $length > 9;
        $found{$prod} = 1
            if join('', sort split //, "$a$b$prod") eq '123456789';
    }
}
say sum keys %found;
