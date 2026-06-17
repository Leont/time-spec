package Time::Spec;

use strict;
use warnings;

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

1;

# ABSTRACT: a wrapper around struct timespec

=head1 SYNOPSIS

 my $spec = Time::Spec->new(1.5);
 my_sleeper($spec);
 say $spec->to_float;

=head1 DESCRIPTION

This holds a time specification, broken down into seconds and nanoseconds. This is typically used by XS modules and not by pure-perl ones.

The object overloads numification to act like a fractional seconds when used as such.

=method new($fractional)

This creates a new C<Time::Spec> object from a fractional amount of time.

=method new_from_pair($seconds, $nano_seconds)

This creates a new C<Time::Spec> object from the second and nano second values.

=method sec()

This returns the number of whole seconds.

=method nsec()

This returns the fractional part of the time specification in nanoseconds.

=method to_float()

Convert the time back into fractional seconds.

=method to_pair()

This returns a pair of seconds and nanoseconds of the object.
