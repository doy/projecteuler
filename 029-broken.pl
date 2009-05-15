#!/usr/bin/perl
use strict;
use warnings;
use Math::Factor::XS qw/factors/;
use List::MoreUtils qw/uniq/;

my $n = $ARGV[0];

my %dups;
# have to go up to $n^2-ish because, for example, 2^12 reduces to both 4^6 and
# 8^4, but neither of those reduce to each other, and if $n is 8, you'll miss
# both of them.
for my $b (2..$n**2) {
    my @bfactors = factors($b);
    next unless @bfactors;
    for my $a (2..$n) {
        for my $bfact (@bfactors) {
            my ($olda, $oldb) = ($a, $b);
            my ($newa, $newb) = ($a**$bfact, $b / $bfact);
            next unless $newa <= $n;
            next unless $newb <= $n;
            ($olda, $oldb, $newa, $newb) = ($newa, $newb, $olda, $oldb)
                if !exists $dups{"$newa^$newb"} && exists $dups{"$olda^$oldb"};
            $dups{"$olda^$oldb"}{"$newa^$newb"} = 1;
            $dups{"$olda^$oldb"}{$_} = 1 for keys %{ $dups{"$newa^$newb"} };
            $dups{$_}{"$olda^$oldb"} = 1 for keys %{ $dups{"$newa^$newb"} };
            $dups{"$newa^$newb"}{"$olda^$oldb"} = 1;
        }
    }
}
my $total = ($n - 2 + 1)**2;
for my $dup (keys %dups) {
    my ($a, $b) = split /\^/, $dup;
    next if $a > $n or $b > $n;
    $total -= grep { my ($a, $b) = split /\^/, $_; $a <= $n && $b <= $n }
                   keys %{ $dups{$dup} };
    for my $subdup (keys %{ $dups{$dup} }) {
        $dups{$subdup} = {};
    }
}
print "$total\n";
