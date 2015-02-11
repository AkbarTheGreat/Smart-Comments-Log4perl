#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 'no_plan';
use Smart::Comments;

close *STDERR;
my $STDERR = q{};
open *STDERR, '>', \$STDERR;

### Testing 1...
#### Testing 2...
##### Testing 3...

my $expected = "\n" . '### Testing 1...' . "\n"
                    . '### Testing 2...' . "\n"
                    . '### Testing 3...' . "\n";

is $STDERR, $expected  => 'Standard logging messages work';

