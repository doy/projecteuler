#!/usr/bin/perl
use strict;
use warnings;

my $num = 317584931803;
my $test = 3;
while (1) {
    if ($num % $test) {
        $test += 2;
    }
    else {
        $num /= $test;
    }
    last if $test > sqrt $num;
}
print "$num\n";
