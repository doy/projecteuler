#!/usr/bin/perl
use strict;
use warnings;
use List::MoreUtils qw/firstidx/;

sub n_digit_number_digits {
    my ($n) = @_;
    return 9 * 10**($n - 1) * $n;
}

my $prev = 0;
my @total_digits = map { $prev += n_digit_number_digits($_) } 1..6;
@total_digits = (0, @total_digits);

my $prod = 1;
for my $exp (0..6) {
    my $n = 10**$exp;
    my $digits = firstidx { $_ >= $n } @total_digits;
    $n -= $total_digits[$digits - 1];
    my $number = int(($n + $digits - 1) / $digits) + 10**($digits - 1) - 1;
    my $digit = substr $number, ($n + $digits - 1) % $digits, 1;
    $prod *= $digit;
}
print "$prod\n";
