#!/usr/bin/perl
use strict;
use warnings;

sub cycle_length {
    my ($n) = @_;

    my $carry = 1;
    my $idx = 0;
    my %seen;
    for my $i (1..$n) {
        $carry = ($carry * 10) % $n;
        return $idx - $seen{$carry} if exists $seen{$carry};
        $seen{$carry} = $idx++;
    }
    die "oops! ($n)";
}

my ($max, $max_idx) = (0, 0);
for (2..1000) {
    my $length = cycle_length($_);
    if ($length > $max) {
        $max = $length;
        $max_idx = $_;
    }
}
print "$max_idx\n";
