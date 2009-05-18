#!/usr/bin/perl
use strict;
use warnings;

my @denom = qw/200 100 50 20 10 5 2/;
my $count = 0;
for my $a (0..1) {
    for my $b (0..2) {
        for my $c (0..4) {
            for my $d (0..10) {
                for my $e (0..20) {
                    for my $f (0..40) {
                        for my $g (0..100) {
                            $count++ if $a * $denom[0]
                                      + $b * $denom[1]
                                      + $c * $denom[2]
                                      + $d * $denom[3]
                                      + $e * $denom[4]
                                      + $f * $denom[5]
                                      + $g * $denom[6] <= 200;
                            last if $a * $denom[0]
                                  + $b * $denom[1]
                                  + $c * $denom[2]
                                  + $d * $denom[3]
                                  + $e * $denom[4]
                                  + $f * $denom[5]
                                  + $g * $denom[6] > 200;
                        }
                        last if $a * $denom[0]
                              + $b * $denom[1]
                              + $c * $denom[2]
                              + $d * $denom[3]
                              + $e * $denom[4]
                              + $f * $denom[5] > 200;
                    }
                    last if $a * $denom[0]
                          + $b * $denom[1]
                          + $c * $denom[2]
                          + $d * $denom[3]
                          + $e * $denom[4] > 200;
                }
                last if $a * $denom[0]
                      + $b * $denom[1]
                      + $c * $denom[2]
                      + $d * $denom[3] > 200;
            }
            last if $a * $denom[0]
                  + $b * $denom[1]
                  + $c * $denom[2] > 200;
        }
        last if $a * $denom[0]
              + $b * $denom[1] > 200;
    }
    last if $a * $denom[0] > 200;
}
print "$count\n";
