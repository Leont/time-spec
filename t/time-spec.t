#! perl

use strict;
use warnings;

use Test::More;
use POSIX 'round';

use Time::Spec;

sub round_to {
	my ($number, $offset) = @_;
	my $factor = 10 ** $offset;
	return $factor * round($number / $factor);
}

my $spec1 = Time::Spec->new(3.6);
is $spec1->sec, 3;
is round_to($spec1->nsec, 2), 600000000;
is round_to($spec1->to_float, -1), 3.6;
is round_to($spec1 + 1, -1), 4.6;

my $spec2 = Time::Spec->new(3600);
is $spec2->sec, 3600;
is $spec2->nsec, 0;

done_testing;
