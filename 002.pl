#!/usr/bin/perl
use strict;
use warnings;

my $root5 = sqrt 5;
my $phi = (1 + $root5)/2;

sub fib { int (($phi**$_[0]-(1-$phi)**$_[0])/$root5 + 0.5) }

my $i = 0;
my $sum = 0;
while (1) {
    $i++;
    my $n = fib $i;
    last if $n > 1000000;
    $sum += $n if $n % 2 == 0;
}
print "$sum\n";
