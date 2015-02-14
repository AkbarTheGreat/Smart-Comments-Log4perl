#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 'no_plan';
use Smart::Comments;

BEGIN
{
	$ENV{'SCL4P_CONFIG'} = 't/complex.config';
	require Smart::Comments::Log4perl;
}

close *STDERR;
my $STDERR = q{};
open *STDERR, '>', \$STDERR;

### Testing 1...
#### Testing 2...
##### Testing 3...

my $expected = qr{
                  \[\d+\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \-                                 \s+
                  \[\d+\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \- \s \#\#\# \s Testing \s 1\.\.\. \s+
                  \[\d+\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \-                                 \s+
                  \[\d+\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \- \s \#\#\# \s Testing \s 2\.\.\. \s+
                  \[\d+\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \-                                 \s+
                  \[\d+\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \- \s \#\#\# \s Testing \s 3\.\.\. \s+
                 }msx;

like $STDERR, $expected  => 'Custom configured logging messages work';

