#!/usr/bin/perl
use strict;
use warnings;
use 5.010;
use Math::Prime::XS qw/sieve_primes/;
use Heap::Simple;
use List::MoreUtils qw/uniq/;
use List::Util qw/reduce/;

my @primes = sieve_primes(1e5);
my %factors;

sub factors {
    use integer;
    my ($n_orig) = @_;
    my @ret;
    my $prime_idx = 0;
    my $n = $n_orig;
    while ($n > 1) {
        my $prime = $primes[$prime_idx];
        if (exists $factors{$n}) {
            push @ret, @{ $factors{$n} };
            last;
        }
        elsif (($n / $prime) * $prime == $n) {
            $n /= $prime;
            push @ret, $prime;
        }
        else {
            $prime_idx++;
        }
    }
    $factors{$n_orig} = \@ret;
    return @ret;
}

our ($a, $b);
my $heap = Heap::Simple->new(elements => 'Any');
for my $n (1..100000) {
    my $rad = reduce { $a * $b } uniq factors($n);
    $heap->key_insert($rad * 1e5 + $n, $n);
}
$heap->extract_top for 1..9999;
say $heap->extract_top;
