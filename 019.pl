#!/usr/bin/perl
use strict;
use warnings;
use DateTime;

my $day = DateTime->new(year => 1901, month => 1, day => 1);
my $count = 0;
while ($day->year < 2001) {
    $count++ if $day->day_of_week == 7;
    $day->add(months => 1);
}
print "$count\n";
