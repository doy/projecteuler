#!/usr/bin/perl
use warnings;

$t+=(!($_%5&& $_%3)?$_:0)for(1..999);
print "$t\n";
