#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More 'no_plan';
use Smart::Comments;
use Smart::Comments::Log4perl;

close *STDERR;
my $STDERR = q{};
open *STDERR, '>', \$STDERR;

### log_config: 't/sample.config'
### Testing 1...
#### Testing 2...
##### Testing 3...

my $expected = qr{
                  \[0\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \-                                 \s+
                  \[0\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \- \s \#\#\# \s Testing \s 1\.\.\. \s+
                  \[0\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \-                                 \s+
                  \[0\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \- \s \#\#\# \s Testing \s 2\.\.\. \s+
                  \[0\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \-                                 \s+
                  \[0\] \s /.*/lib/Smart/Comments/Log4perl.pm \s \d+ \s main \s \- \s \#\#\# \s Testing \s 3\.\.\. \s+
                 }msx;

like $STDERR, $expected  => 'Custom configured logging messages work';

