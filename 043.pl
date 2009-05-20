#!/usr/bin/perl
use strict;
use warnings;
use Math::Combinatorics;
use integer;

my $comb = Math::Combinatorics->new(data => [0..9]);
my @numbers;
while (my @perm = $comb->next_permutation) {
    next unless (100 * $perm[1] + 10 * $perm[2] + $perm[3]) % 2  == 0;
    next unless (100 * $perm[2] + 10 * $perm[3] + $perm[4]) % 3  == 0;
    next unless (100 * $perm[3] + 10 * $perm[4] + $perm[5]) % 5  == 0;
    next unless (100 * $perm[4] + 10 * $perm[5] + $perm[6]) % 7  == 0;
    next unless (100 * $perm[5] + 10 * $perm[6] + $perm[7]) % 11 == 0;
    next unless (100 * $perm[6] + 10 * $perm[7] + $perm[8]) % 13 == 0;
    next unless (100 * $perm[7] + 10 * $perm[8] + $perm[9]) % 17 == 0;
    push @numbers, join '', @perm;
}
my $sum = join '+', @numbers;
print qx{echo $sum | bc};
