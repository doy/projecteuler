#!/usr/bin/perl
use strict;
use warnings;
use Math::Factor::XS qw/factors/;
use List::Util qw/sum/;

sub abundant {
    my ($n) = @_;
    return 1 + (sum(factors($n)) || 0) > $n;
}

my @abundant = grep { abundant($_) } 1..28123;
my %sums;
A: for my $a (@abundant) {
    for my $b (@abundant) {
        my $n = $a + $b;
        next A if $n > 28123;
        $sums{$n} = 1;
    }
}
my $total = 0;
for my $n (1..28123) {
    $total += $n unless exists $sums{$n};
}
print "$total\n";
