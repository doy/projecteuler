#!/usr/bin/perl
use strict;
use warnings;
use Math::Prime::XS qw/sieve_primes/;
use List::MoreUtils qw/all/;

sub rotations {
    my $str = shift;
    my @ret;
    for (1..(length $str)) {
        push @ret, $str;
        my $letter = substr $str, 0, 1, '';
        $str = "$str$letter";
    }
    return @ret;
}

my %primes = map { $_, 1 } sieve_primes(1e6);
my $total = 0;
for my $prime (keys %primes) {
    $total++ if all { exists $primes{$_} } rotations($prime);
}
print "$total\n";
