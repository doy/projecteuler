#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use List::MoreUtils qw/uniq/;

my $n = $ARGV[0];

my @list;
my %list;
for my $a (2..$n) {
    for my $b (2..$n) {
        my $pow = `echo '$a^$b' | bc`;
        chomp $pow;
        #push @{ $list{$pow} ||= [] }, [$a, $b];
        push @list, $pow;
    }
    #say $a;
}
#for my $val (keys %list) {
    #next unless @{ $list{$val} } > 1;
    #say join ' == ', map { "$_->[0]^$_->[1]" } @{ $list{$val} };
#}
say scalar uniq sort @list;
