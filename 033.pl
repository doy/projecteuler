#!/usr/bin/perl
use strict;
use warnings;

my ($num_total, $denom_total) = (1, 1);
for my $num (10..99) {
    for my $denom ($num..99) {
        next if $num == $denom;
        my $real_frac = $num / $denom;

        my ($n1, $n2) = split //, $num;
        my $denom_test = $denom;
        my $frac;
        if ($denom_test =~ s/$n1//) {
            next unless $denom_test && $n1;
            $frac = $n2 / $denom_test;
        }
        elsif ($denom_test =~ s/$n2//) {
            next unless $denom_test && $n2;
            $frac = $n1 / $denom_test;
        }
        else {
            next;
        }
        if ($frac == $real_frac) {
            $num_total *= $num;
            $denom_total *= $denom;
        }
    }
}
print $num_total/$denom_total, "\n";
