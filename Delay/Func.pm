package Video::Delay::Func;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use English qw(-no_match_vars);
use Error::Pure qw(err);

# Version.
our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Function.
	$self->{'func'} = '1000 * sin(t)';

	# Counter increment.
	$self->{'incr'} = 0.1;

	# Process params.
	set_params($self, @params);

	# Counter.
	$self->{'counter'} = 0;

	# Object.
	return $self;
}

# Get delay.
sub delay {
	my $self = shift;

	# Input.
	$self->{'counter'} += $self->{'incr'};
	my $input = $self->{'func'};
	my $c = $self->{'counter'};
	$input =~ s/t/$c/g;

	# Eval.
	my $ret = eval $input;
	if ($EVAL_ERROR) {
		err $EVAL_ERROR;
	}

	return $ret;
}

1;

__END__
