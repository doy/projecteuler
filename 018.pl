#!/usr/bin/perl
use strict;
use warnings;
# http://tozt.net/code/Graph-Implicit/
use Graph::Implicit;
use List::Util qw/sum max/;

my $triangle_txt = <<'TRIANGLE';
                     75
                   95 64
                  17 47 82
                18 35 87 10
               20 04 82 47 65
             19 01 23 75 03 34
            88 02 77 73 07 63 67
          99 65 04 28 06 16 70 92
         41 41 26 56 83 40 80 70 33
       41 48 72 33 47 32 37 16 94 29
      53 71 44 65 25 43 91 52 97 51 14
    70 11 33 28 77 73 17 78 39 68 17 57
   91 71 52 38 17 14 91 43 58 50 27 29 48
 63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
TRIANGLE
my @triangle_lines = split /\n/, $triangle_txt;
my @triangle = map { [split ' ', $_] } @triangle_lines;

my $graph = Graph::Implicit->new(sub {
    my ($vx, $vy) = split ' ', shift;
    return if $vx == @triangle - 1;
    return ([($vx + 1) . " " . $vy,       100 - $triangle[$vx + 1][$vy]],
            [($vx + 1) . " " . ($vy + 1), 100 - $triangle[$vx + 1][$vy + 1]]);
});
my ($paths, $blah) = $graph->dijkstra("0 0");
my @paths;
my $bottom_row = @triangle - 1;
for my $i (0..$bottom_row) {
    push @paths, [Graph::Implicit::make_path($paths, "$bottom_row $i")];
}
my @path_values = map { [map { my ($x, $y) = split; $triangle[$x][$y] } @$_] }
                      @paths;
my @path_sums = map { sum @$_ } @path_values;
print max(@path_sums), "\n";
