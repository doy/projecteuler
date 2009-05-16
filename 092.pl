#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use List::Util qw/sum/;

my @decided;

for my $n (1..1e7) {
    my $test = $n;
    LOOP: {
        if ($test == 1) {
            $decided[$n] = 0;
        }
        elsif ($test == 89) {
            $decided[$n] = 1;
        }
        elsif ($decided[$test]) {
            $decided[$n] = $decided[$test];
        }
        else {
            my @test = split //, $test;
            $test = sum map { $_**2 } @test;
            redo;
        }
    }
}
say scalar grep { $_ } @decided
