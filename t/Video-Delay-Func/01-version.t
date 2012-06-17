# Pragmas.
use strict;
use warnings;

# Modules.
use Video::Delay::Func;
use Test::More 'tests' => 1;

# Test.
is($Video::Delay::Func::VERSION, 0.01, 'Version.');
